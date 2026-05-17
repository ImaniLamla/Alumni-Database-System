USE ctis_alumni_db;

-- =========================
-- CURRENT EMPLOYMENT REPORT
-- =========================
DROP VIEW IF EXISTS view_current_employment;

CREATE VIEW view_current_employment AS
SELECT 
    a.alumni_id,
    a.first_name,
    a.last_name,
    a.personal_email,
    dp.program_name,
    dl.degree_level_name,
    ape.graduation_year,
    emp.employer_name,
    i.industry_name,
    eh.job_title,
    eh.job_city,
    eh.job_state
FROM alumni a
JOIN alumni_program_enrollments ape 
    ON a.alumni_id = ape.alumni_id
JOIN degree_programs dp 
    ON ape.program_id = dp.program_id
JOIN degree_levels dl 
    ON ape.degree_level_id = dl.degree_level_id
LEFT JOIN employment_history eh 
    ON a.alumni_id = eh.alumni_id AND eh.is_current = TRUE
LEFT JOIN employers emp 
    ON eh.employer_id = emp.employer_id
LEFT JOIN industries i 
    ON emp.industry_id = i.industry_id
WHERE a.is_active = TRUE;

-- =========================
-- ALUMNI BY GRADUATION YEAR
-- =========================
DROP VIEW IF EXISTS view_alumni_by_graduation_year;

CREATE VIEW view_alumni_by_graduation_year AS
SELECT 
    ape.graduation_year,
    COUNT(DISTINCT a.alumni_id) AS alumni_count
FROM alumni a
JOIN alumni_program_enrollments ape 
    ON a.alumni_id = ape.alumni_id
JOIN enrollment_statuses es 
    ON ape.status_id = es.status_id
WHERE es.status_name = 'Graduated'
GROUP BY ape.graduation_year
ORDER BY ape.graduation_year;

-- =========================
-- ALUMNI BY DEGREE PROGRAM
-- =========================
DROP VIEW IF EXISTS view_alumni_by_degree_program;

CREATE VIEW view_alumni_by_degree_program AS
SELECT 
    dp.program_name,
    COUNT(DISTINCT a.alumni_id) AS alumni_count
FROM alumni a
JOIN alumni_program_enrollments ape 
    ON a.alumni_id = ape.alumni_id
JOIN degree_programs dp 
    ON ape.program_id = dp.program_id
GROUP BY dp.program_name
ORDER BY dp.program_name;

-- =========================
-- ALUMNI BY INDUSTRY
-- =========================
DROP VIEW IF EXISTS view_alumni_by_industry;

CREATE VIEW view_alumni_by_industry AS
SELECT 
    i.industry_name,
    COUNT(DISTINCT a.alumni_id) AS alumni_count
FROM alumni a
JOIN employment_history eh 
    ON a.alumni_id = eh.alumni_id
JOIN employers emp 
    ON eh.employer_id = emp.employer_id
JOIN industries i 
    ON emp.industry_id = i.industry_id
WHERE eh.is_current = TRUE
GROUP BY i.industry_name
ORDER BY alumni_count DESC;

-- =========================
-- ALUMNI BY SKILL
-- =========================
DROP VIEW IF EXISTS view_alumni_by_skill;

CREATE VIEW view_alumni_by_skill AS
SELECT 
    s.skill_name,
    COUNT(DISTINCT a.alumni_id) AS alumni_count
FROM alumni a
JOIN alumni_skills als 
    ON a.alumni_id = als.alumni_id
JOIN skills s 
    ON als.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY alumni_count DESC;

-- =========================
-- FOLLOW-UP NEEDED REPORT
-- =========================
DROP VIEW IF EXISTS view_follow_up_needed;

CREATE VIEW view_follow_up_needed AS
SELECT 
    a.alumni_id,
    a.first_name,
    a.last_name,
    a.personal_email,
    it.interaction_type_name,
    ci.interaction_date,
    ci.notes
FROM contact_interactions ci
JOIN alumni a 
    ON ci.alumni_id = a.alumni_id
JOIN interaction_types it 
    ON ci.interaction_type_id = it.interaction_type_id
WHERE ci.follow_up_needed = TRUE
ORDER BY ci.interaction_date DESC;

-- =========================
-- NON-GRADUATED STUDENTS
-- =========================
DROP VIEW IF EXISTS view_non_graduated_students;

CREATE VIEW view_non_graduated_students AS
SELECT 
    a.alumni_id,
    a.first_name,
    a.last_name,
    a.personal_email,
    dp.program_name,
    dl.degree_level_name,
    es.status_name,
    ape.start_year,
    ape.credits_completed
FROM alumni a
JOIN alumni_program_enrollments ape 
    ON a.alumni_id = ape.alumni_id
JOIN degree_programs dp 
    ON ape.program_id = dp.program_id
JOIN degree_levels dl 
    ON ape.degree_level_id = dl.degree_level_id
JOIN enrollment_statuses es 
    ON ape.status_id = es.status_id
WHERE es.status_name <> 'Graduated';