DROP DATABASE IF EXISTS ctis_alumni_db;
CREATE DATABASE ctis_alumni_db;
USE ctis_alumni_db;

-- =========================
-- LOOKUP TABLES
-- =========================

CREATE TABLE degree_levels (
    degree_level_id INT AUTO_INCREMENT PRIMARY KEY,
    degree_level_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE enrollment_statuses (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE degree_programs (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE industries (
    industry_id INT AUTO_INCREMENT PRIMARY KEY,
    industry_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE interaction_types (
    interaction_type_id INT AUTO_INCREMENT PRIMARY KEY,
    interaction_type_name VARCHAR(50) NOT NULL UNIQUE
);

-- =========================
-- MAIN TABLES
-- =========================

CREATE TABLE alumni (
    alumni_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    preferred_name VARCHAR(50),
    personal_email VARCHAR(100) UNIQUE,
    phone VARCHAR(25),
    linkedin_url VARCHAR(255),
    city VARCHAR(75),
    state VARCHAR(50),
    country VARCHAR(75) DEFAULT 'United States',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE alumni_program_enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    alumni_id INT NOT NULL,
    program_id INT NOT NULL,
    degree_level_id INT NOT NULL,
    status_id INT NOT NULL,
    start_year YEAR,
    graduation_year YEAR,
    credits_completed INT,
    honors VARCHAR(100),

    FOREIGN KEY (alumni_id) REFERENCES alumni(alumni_id)
        ON DELETE CASCADE,

    FOREIGN KEY (program_id) REFERENCES degree_programs(program_id),

    FOREIGN KEY (degree_level_id) REFERENCES degree_levels(degree_level_id),

    FOREIGN KEY (status_id) REFERENCES enrollment_statuses(status_id)
);

CREATE TABLE employers (
    employer_id INT AUTO_INCREMENT PRIMARY KEY,
    employer_name VARCHAR(150) NOT NULL UNIQUE,
    industry_id INT,
    city VARCHAR(75),
    state VARCHAR(50),
    country VARCHAR(75) DEFAULT 'United States',
    website_url VARCHAR(255),

    FOREIGN KEY (industry_id) REFERENCES industries(industry_id)
);

CREATE TABLE employment_history (
    employment_id INT AUTO_INCREMENT PRIMARY KEY,
    alumni_id INT NOT NULL,
    employer_id INT NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN DEFAULT FALSE,
    job_city VARCHAR(75),
    job_state VARCHAR(50),
    job_country VARCHAR(75) DEFAULT 'United States',

    FOREIGN KEY (alumni_id) REFERENCES alumni(alumni_id)
        ON DELETE CASCADE,

    FOREIGN KEY (employer_id) REFERENCES employers(employer_id)
);

CREATE TABLE alumni_skills (
    alumni_id INT NOT NULL,
    skill_id INT NOT NULL,

    PRIMARY KEY (alumni_id, skill_id),

    FOREIGN KEY (alumni_id) REFERENCES alumni(alumni_id)
        ON DELETE CASCADE,

    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
        ON DELETE CASCADE
);

CREATE TABLE contact_interactions (
    interaction_id INT AUTO_INCREMENT PRIMARY KEY,
    alumni_id INT NOT NULL,
    interaction_type_id INT NOT NULL,
    interaction_date DATE NOT NULL,
    notes TEXT,
    follow_up_needed BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (alumni_id) REFERENCES alumni(alumni_id)
        ON DELETE CASCADE,

    FOREIGN KEY (interaction_type_id) REFERENCES interaction_types(interaction_type_id)
);

CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- =========================
-- STARTER LOOKUP DATA
-- =========================

INSERT INTO degree_levels (degree_level_name)
VALUES
('Certificate'),
('Associate'),
('Bachelors'),
('Masters'),
('Doctorate');

INSERT INTO enrollment_statuses (status_name)
VALUES
('Graduated'),
('Did Not Graduate'),
('Currently Enrolled'),
('Transferred'),
('Withdrawn');

INSERT INTO degree_programs (program_name)
VALUES
('Computer Science'),
('CIS - Integrated Technology Support'),
('CIS - Networking and Cybersecurity'),
('CIS - Programmer/Analyst'),
('CIS - Web Specialist');

INSERT INTO industries (industry_name)
VALUES
('Information Technology'),
('Healthcare'),
('Finance'),
('Education'),
('Government'),
('Manufacturing'),
('Retail'),
('Consulting'),
('Software Development'),
('Cybersecurity'),
('Telecommunications');

INSERT INTO skills (skill_name)
VALUES
('Python'),
('Java'),
('JavaScript'),
('SQL'),
('MySQL'),
('React'),
('Node.js'),
('Cybersecurity'),
('Networking'),
('Database Design'),
('Web Development'),
('Project Management');

INSERT INTO interaction_types (interaction_type_name)
VALUES
('Email'),
('Phone Call'),
('LinkedIn Message'),
('In-Person Meeting'),
('Event Attendance'),
('Survey Response');

INSERT INTO reports (report_name, description)
VALUES
('Alumni by Graduation Year', 'Lists alumni grouped by graduation year.'),
('Alumni by Degree Program', 'Lists alumni grouped by CTIS degree program.'),
('Current Employment Report', 'Shows alumni and their current employers.'),
('Alumni by Industry', 'Shows alumni grouped by employer industry.'),
('Alumni by Skill', 'Shows alumni grouped by technical skills.'),
('Follow-Up Needed Report', 'Shows alumni contact interactions requiring follow-up.');

-- =========================
-- TEST QUERIES
-- =========================

SHOW TABLES;

SELECT * FROM degree_levels;
SELECT * FROM enrollment_statuses;
SELECT * FROM degree_programs;
SELECT * FROM industries;