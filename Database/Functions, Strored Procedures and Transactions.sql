USE ctis_alumni_db;

DELIMITER $$

-- =========================
-- FUNCTIONS
-- =========================

DROP FUNCTION IF EXISTS fn_is_valid_email$$
CREATE FUNCTION fn_is_valid_email(email VARCHAR(100))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';
END$$

DROP FUNCTION IF EXISTS fn_year_is_valid$$
CREATE FUNCTION fn_year_is_valid(input_year YEAR)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN input_year IS NULL OR input_year BETWEEN 1950 AND YEAR(CURDATE()) + 10;
END$$

-- =========================
-- TRIGGERS
-- =========================

DROP TRIGGER IF EXISTS trg_validate_alumni_insert$$
CREATE TRIGGER trg_validate_alumni_insert
BEFORE INSERT ON alumni
FOR EACH ROW
BEGIN
    IF NEW.personal_email IS NOT NULL 
       AND fn_is_valid_email(NEW.personal_email) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid alumni email format.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_validate_alumni_update$$
CREATE TRIGGER trg_validate_alumni_update
BEFORE UPDATE ON alumni
FOR EACH ROW
BEGIN
    IF NEW.personal_email IS NOT NULL 
       AND fn_is_valid_email(NEW.personal_email) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid alumni email format.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_validate_enrollment_insert$$
CREATE TRIGGER trg_validate_enrollment_insert
BEFORE INSERT ON alumni_program_enrollments
FOR EACH ROW
BEGIN
    IF fn_year_is_valid(NEW.start_year) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid start year.';
    END IF;

    IF fn_year_is_valid(NEW.graduation_year) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid graduation year.';
    END IF;

    IF NEW.graduation_year IS NOT NULL 
       AND NEW.start_year IS NOT NULL 
       AND NEW.graduation_year < NEW.start_year THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Graduation year cannot be before start year.';
    END IF;

    IF NEW.credits_completed IS NOT NULL 
       AND NEW.credits_completed < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Credits completed cannot be negative.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_validate_enrollment_update$$
CREATE TRIGGER trg_validate_enrollment_update
BEFORE UPDATE ON alumni_program_enrollments
FOR EACH ROW
BEGIN
    IF fn_year_is_valid(NEW.start_year) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid start year.';
    END IF;

    IF fn_year_is_valid(NEW.graduation_year) = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid graduation year.';
    END IF;

    IF NEW.graduation_year IS NOT NULL 
       AND NEW.start_year IS NOT NULL 
       AND NEW.graduation_year < NEW.start_year THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Graduation year cannot be before start year.';
    END IF;

    IF NEW.credits_completed IS NOT NULL 
       AND NEW.credits_completed < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Credits completed cannot be negative.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_validate_employment_insert$$
CREATE TRIGGER trg_validate_employment_insert
BEFORE INSERT ON employment_history
FOR EACH ROW
BEGIN
    IF NEW.end_date IS NOT NULL 
       AND NEW.start_date IS NOT NULL 
       AND NEW.end_date < NEW.start_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employment end date cannot be before start date.';
    END IF;

    IF NEW.is_current = TRUE THEN
        SET NEW.end_date = NULL;
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_validate_employment_update$$
CREATE TRIGGER trg_validate_employment_update
BEFORE UPDATE ON employment_history
FOR EACH ROW
BEGIN
    IF NEW.end_date IS NOT NULL 
       AND NEW.start_date IS NOT NULL 
       AND NEW.end_date < NEW.start_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employment end date cannot be before start date.';
    END IF;

    IF NEW.is_current = TRUE THEN
        SET NEW.end_date = NULL;
    END IF;
END$$

-- =========================
-- STORED PROCEDURES
-- =========================

DROP PROCEDURE IF EXISTS sp_add_alumni_with_enrollment$$
CREATE PROCEDURE sp_add_alumni_with_enrollment (
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_preferred_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(25),
    IN p_linkedin_url VARCHAR(255),
    IN p_city VARCHAR(75),
    IN p_state VARCHAR(50),
    IN p_country VARCHAR(75),
    IN p_program_id INT,
    IN p_degree_level_id INT,
    IN p_status_id INT,
    IN p_start_year YEAR,
    IN p_graduation_year YEAR,
    IN p_credits_completed INT,
    IN p_honors VARCHAR(100)
)
BEGIN
    DECLARE new_alumni_id INT;

    START TRANSACTION;

    INSERT INTO alumni (
        first_name, last_name, preferred_name, personal_email,
        phone, linkedin_url, city, state, country
    )
    VALUES (
        p_first_name, p_last_name, p_preferred_name, p_email,
        p_phone, p_linkedin_url, p_city, p_state, 
        COALESCE(p_country, 'United States')
    );

    SET new_alumni_id = LAST_INSERT_ID();

    INSERT INTO alumni_program_enrollments (
        alumni_id, program_id, degree_level_id, status_id,
        start_year, graduation_year, credits_completed, honors
    )
    VALUES (
        new_alumni_id, p_program_id, p_degree_level_id, p_status_id,
        p_start_year, p_graduation_year, p_credits_completed, p_honors
    );

    COMMIT;
END$$

DROP PROCEDURE IF EXISTS sp_add_current_employment$$
CREATE PROCEDURE sp_add_current_employment (
    IN p_alumni_id INT,
    IN p_employer_id INT,
    IN p_job_title VARCHAR(100),
    IN p_start_date DATE,
    IN p_job_city VARCHAR(75),
    IN p_job_state VARCHAR(50),
    IN p_job_country VARCHAR(75)
)
BEGIN
    START TRANSACTION;

    UPDATE employment_history
    SET 
        is_current = FALSE,
        end_date = COALESCE(end_date, DATE_SUB(p_start_date, INTERVAL 1 DAY))
    WHERE alumni_id = p_alumni_id
      AND is_current = TRUE;

    INSERT INTO employment_history (
        alumni_id, employer_id, job_title, start_date,
        end_date, is_current, job_city, job_state, job_country
    )
    VALUES (
        p_alumni_id, p_employer_id, p_job_title, p_start_date,
        NULL, TRUE, p_job_city, p_job_state,
        COALESCE(p_job_country, 'United States')
    );

    COMMIT;
END$$

DROP PROCEDURE IF EXISTS sp_update_alumni_contact$$
CREATE PROCEDURE sp_update_alumni_contact (
    IN p_alumni_id INT,
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(25),
    IN p_linkedin_url VARCHAR(255),
    IN p_city VARCHAR(75),
    IN p_state VARCHAR(50),
    IN p_country VARCHAR(75)
)
BEGIN
    UPDATE alumni
    SET 
        personal_email = p_email,
        phone = p_phone,
        linkedin_url = p_linkedin_url,
        city = p_city,
        state = p_state,
        country = COALESCE(p_country, 'United States')
    WHERE alumni_id = p_alumni_id;
END$$

DROP PROCEDURE IF EXISTS sp_add_skill_to_alumni$$
CREATE PROCEDURE sp_add_skill_to_alumni (
    IN p_alumni_id INT,
    IN p_skill_id INT
)
BEGIN
    INSERT IGNORE INTO alumni_skills (alumni_id, skill_id)
    VALUES (p_alumni_id, p_skill_id);
END$$

DROP PROCEDURE IF EXISTS sp_log_contact_interaction$$
CREATE PROCEDURE sp_log_contact_interaction (
    IN p_alumni_id INT,
    IN p_interaction_type_id INT,
    IN p_interaction_date DATE,
    IN p_notes TEXT,
    IN p_follow_up_needed BOOLEAN
)
BEGIN
    INSERT INTO contact_interactions (
        alumni_id, interaction_type_id, interaction_date, notes, follow_up_needed
    )
    VALUES (
        p_alumni_id, p_interaction_type_id, p_interaction_date, p_notes, p_follow_up_needed
    );
END$$

DROP PROCEDURE IF EXISTS sp_mark_alumni_inactive$$
CREATE PROCEDURE sp_mark_alumni_inactive (
    IN p_alumni_id INT
)
BEGIN
    UPDATE alumni
    SET is_active = FALSE
    WHERE alumni_id = p_alumni_id;
END$$

DROP PROCEDURE IF EXISTS sp_update_enrollment_status$$
CREATE PROCEDURE sp_update_enrollment_status (
    IN p_enrollment_id INT,
    IN p_status_id INT,
    IN p_graduation_year YEAR,
    IN p_credits_completed INT,
    IN p_honors VARCHAR(100)
)
BEGIN
    UPDATE alumni_program_enrollments
    SET 
        status_id = p_status_id,
        graduation_year = p_graduation_year,
        credits_completed = p_credits_completed,
        honors = p_honors
    WHERE enrollment_id = p_enrollment_id;
END$$

DROP PROCEDURE IF EXISTS sp_update_employment_status$$
CREATE PROCEDURE sp_update_employment_status (
    IN p_employment_id INT,
    IN p_is_current BOOLEAN,
    IN p_end_date DATE
)
BEGIN
    DECLARE v_alumni_id INT;

    START TRANSACTION;

    -- Get alumni_id for this employment
    SELECT alumni_id INTO v_alumni_id
    FROM employment_history
    WHERE employment_id = p_employment_id;

    -- If setting this job as current
    IF p_is_current = TRUE THEN

        -- Remove current status from all other jobs
        UPDATE employment_history
        SET 
            is_current = FALSE,
            end_date = COALESCE(end_date, CURDATE())
        WHERE alumni_id = v_alumni_id
          AND employment_id <> p_employment_id
          AND is_current = TRUE;

        -- Set this job as current
        UPDATE employment_history
        SET 
            is_current = TRUE,
            end_date = NULL
        WHERE employment_id = p_employment_id;

    ELSE
        -- Mark as not current
        UPDATE employment_history
        SET 
            is_current = FALSE,
            end_date = p_end_date
        WHERE employment_id = p_employment_id;
    END IF;

    COMMIT;
END$$

DELIMITER ;