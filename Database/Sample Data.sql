USE ctis_alumni_db;

-- =========================
-- MAIN TABLE SAMPLE DATA
-- =========================

INSERT INTO alumni
(first_name, last_name, preferred_name, personal_email, phone, linkedin_url, city, state, country, is_active)
VALUES
('Jordan', 'Miller', 'Jordan', 'jordan.miller@email.com', '402-555-1001', 'https://linkedin.com/in/jordanmiller', 'Omaha', 'NE', 'United States', TRUE),
('Alyssa', 'Nguyen', 'Alyssa', 'alyssa.nguyen@email.com', '402-555-1002', 'https://linkedin.com/in/alyssanguyen', 'Lincoln', 'NE', 'United States', TRUE),
('Marcus', 'Johnson', 'Marcus', 'marcus.johnson@email.com', '712-555-1003', 'https://linkedin.com/in/marcusjohnson', 'Sioux City', 'IA', 'United States', TRUE),
('Emily', 'Carter', 'Emily', 'emily.carter@email.com', '402-555-1004', 'https://linkedin.com/in/emilycarter', 'Wayne', 'NE', 'United States', TRUE),
('David', 'Patel', 'David', 'david.patel@email.com', '308-555-1005', 'https://linkedin.com/in/davidpatel', 'Kearney', 'NE', 'United States', TRUE),
('Sofia', 'Ramirez', 'Sofia', 'sofia.ramirez@email.com', '402-555-1006', 'https://linkedin.com/in/sofiaramirez', 'Omaha', 'NE', 'United States', TRUE),
('Brandon', 'Lee', 'Brandon', 'brandon.lee@email.com', '531-555-1007', 'https://linkedin.com/in/brandonlee', 'Lincoln', 'NE', 'United States', TRUE),
('Natalie', 'Wilson', 'Natalie', 'natalie.wilson@email.com', '402-555-1008', 'https://linkedin.com/in/nataliewilson', 'Norfolk', 'NE', 'United States', TRUE),
('Tyler', 'Anderson', 'Tyler', 'tyler.anderson@email.com', '402-555-1009', 'https://linkedin.com/in/tyleranderson', 'Columbus', 'NE', 'United States', TRUE),
('Grace', 'Thompson', 'Grace', 'grace.thompson@email.com', '402-555-1010', 'https://linkedin.com/in/gracethompson', 'Fremont', 'NE', 'United States', TRUE),
('Ethan', 'Brown', 'Ethan', 'ethan.brown@email.com', '605-555-1011', 'https://linkedin.com/in/ethanbrown', 'Sioux Falls', 'SD', 'United States', TRUE),
('Mia', 'Davis', 'Mia', 'mia.davis@email.com', '402-555-1012', 'https://linkedin.com/in/miadavis', 'Omaha', 'NE', 'United States', TRUE),
('Noah', 'Clark', 'Noah', 'noah.clark@email.com', '402-555-1013', 'https://linkedin.com/in/noahclark', 'Grand Island', 'NE', 'United States', TRUE),
('Olivia', 'Martinez', 'Olivia', 'olivia.martinez@email.com', '402-555-1014', 'https://linkedin.com/in/oliviamartinez', 'Lincoln', 'NE', 'United States', TRUE),
('Caleb', 'Roberts', 'Caleb', 'caleb.roberts@email.com', '402-555-1015', 'https://linkedin.com/in/calebroberts', 'Wayne', 'NE', 'United States', FALSE),
('Hannah', 'Kim', 'Hannah', 'hannah.kim@email.com', '402-555-1016', 'https://linkedin.com/in/hannahkim', 'Omaha', 'NE', 'United States', TRUE),
('Isaac', 'Moore', 'Isaac', 'isaac.moore@email.com', '402-555-1017', 'https://linkedin.com/in/isaacmoore', 'Lincoln', 'NE', 'United States', TRUE),
('Chloe', 'Adams', 'Chloe', 'chloe.adams@email.com', '402-555-1018', 'https://linkedin.com/in/chloeadams', 'Norfolk', 'NE', 'United States', TRUE),
('Logan', 'Scott', 'Logan', 'logan.scott@email.com', '402-555-1019', 'https://linkedin.com/in/loganscott', 'Omaha', 'NE', 'United States', TRUE),
('Ava', 'Bennett', 'Ava', 'ava.bennett@email.com', '402-555-1020', 'https://linkedin.com/in/avabennett', 'Kearney', 'NE', 'United States', TRUE);

INSERT INTO employers
(employer_name, industry_id, city, state, country, website_url)
VALUES
('Hudl', 9, 'Lincoln', 'NE', 'United States', 'https://www.hudl.com'),
('Mutual of Omaha', 3, 'Omaha', 'NE', 'United States', 'https://www.mutualofomaha.com'),
('University of Nebraska Medical Center', 2, 'Omaha', 'NE', 'United States', 'https://www.unmc.edu'),
('State of Nebraska', 5, 'Lincoln', 'NE', 'United States', 'https://www.nebraska.gov'),
('Nelnet', 3, 'Lincoln', 'NE', 'United States', 'https://www.nelnet.com'),
('Sandhills Global', 9, 'Lincoln', 'NE', 'United States', 'https://www.sandhills.com'),
('Wayne State College', 4, 'Wayne', 'NE', 'United States', 'https://www.wsc.edu'),
('Fiserv', 3, 'Omaha', 'NE', 'United States', 'https://www.fiserv.com'),
('Apex Systems', 8, 'Omaha', 'NE', 'United States', 'https://www.apexsystems.com'),
('SecureWorks', 10, 'Remote', NULL, 'United States', 'https://www.secureworks.com'),
('Great Plains Communications', 11, 'Blair', 'NE', 'United States', 'https://www.gpcom.com'),
('Conagra Brands', 6, 'Omaha', 'NE', 'United States', 'https://www.conagrabrands.com'),
('Boys Town', 2, 'Omaha', 'NE', 'United States', 'https://www.boystown.org'),
('Omaha Public Schools', 4, 'Omaha', 'NE', 'United States', 'https://www.ops.org'),
('Gallup', 8, 'Omaha', 'NE', 'United States', 'https://www.gallup.com'),
('Union Pacific', 6, 'Omaha', 'NE', 'United States', 'https://www.up.com'),
('Buildertrend', 9, 'Omaha', 'NE', 'United States', 'https://www.buildertrend.com'),
('First National Bank of Omaha', 3, 'Omaha', 'NE', 'United States', 'https://www.fnbo.com'),
('CHI Health', 2, 'Omaha', 'NE', 'United States', 'https://www.chihealth.com'),
('Lutz', 8, 'Omaha', 'NE', 'United States', 'https://www.lutz.us');

INSERT INTO alumni_program_enrollments
(alumni_id, program_id, degree_level_id, status_id, start_year, graduation_year, credits_completed, honors)
VALUES
(1, 1, 3, 1, 2018, 2022, 120, 'Cum Laude'),
(2, 4, 3, 1, 2019, 2023, 120, 'Magna Cum Laude'),
(3, 2, 3, 1, 2017, 2021, 120, NULL),
(4, 5, 2, 1, 2020, 2022, 64, NULL),
(5, 1, 4, 1, 2021, 2023, 36, NULL),
(6, 3, 3, 1, 2018, 2022, 120, 'Cum Laude'),
(7, 4, 3, 1, 2020, 2024, 120, NULL),
(8, 2, 3, 1, 2016, 2020, 120, NULL),
(9, 5, 3, 2, 2019, NULL, 72, NULL),
(10, 1, 3, 1, 2018, 2022, 120, 'Summa Cum Laude'),
(11, 4, 1, 1, 2022, 2023, 18, NULL),
(12, 3, 3, 1, 2017, 2021, 120, NULL),
(13, 2, 3, 4, 2020, NULL, 45, NULL),
(14, 1, 3, 1, 2019, 2023, 120, 'Cum Laude'),
(15, 5, 3, 5, 2018, NULL, 30, NULL),
(16, 4, 4, 1, 2022, 2024, 36, NULL),
(17, 3, 3, 1, 2018, 2022, 120, NULL),
(18, 2, 3, 1, 2019, 2023, 120, 'Cum Laude'),
(19, 1, 3, 3, 2022, NULL, 84, NULL),
(20, 5, 3, 1, 2017, 2021, 120, NULL);

INSERT INTO employment_history
(alumni_id, employer_id, job_title, start_date, end_date, is_current, job_city, job_state, job_country)
VALUES
(1, 1, 'Software Developer', '2022-06-01', NULL, TRUE, 'Lincoln', 'NE', 'United States'),
(2, 10, 'Cybersecurity Analyst', '2023-07-15', NULL, TRUE, 'Remote', NULL, 'United States'),
(3, 5, 'Business Systems Analyst', '2021-06-10', NULL, TRUE, 'Lincoln', 'NE', 'United States'),
(4, 11, 'Network Support Technician', '2022-08-01', NULL, TRUE, 'Blair', 'NE', 'United States'),
(5, 3, 'Data Analyst', '2023-06-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(6, 8, 'Database Analyst', '2022-07-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(7, 4, 'Information Security Specialist', '2024-06-15', NULL, TRUE, 'Lincoln', 'NE', 'United States'),
(8, 6, 'Systems Administrator', '2020-06-01', NULL, TRUE, 'Lincoln', 'NE', 'United States'),
(9, 9, 'IT Support Specialist', '2021-03-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(10, 17, 'Full Stack Developer', '2022-06-20', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(11, 10, 'Security Operations Technician', '2023-09-01', NULL, TRUE, 'Remote', NULL, 'United States'),
(12, 18, 'Application Support Analyst', '2021-07-12', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(13, 14, 'Technology Support Specialist', '2022-01-10', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(14, 2, 'Software Engineer I', '2023-06-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(15, 7, 'Help Desk Technician', '2019-08-01', '2021-05-15', FALSE, 'Wayne', 'NE', 'United States'),
(16, 19, 'Healthcare Data Engineer', '2024-07-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(17, 15, 'Client Technology Consultant', '2022-06-01', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(18, 20, 'IT Consultant', '2023-06-15', NULL, TRUE, 'Omaha', 'NE', 'United States'),
(19, 7, 'Student Web Developer', '2023-08-20', NULL, TRUE, 'Wayne', 'NE', 'United States'),
(20, 12, 'Manufacturing Systems Analyst', '2021-06-01', NULL, TRUE, 'Omaha', 'NE', 'United States');

INSERT INTO alumni_skills
(alumni_id, skill_id)
VALUES
(1, 3), (1, 6), (1, 7), (1, 11),
(2, 8), (2, 9), (2, 4),
(3, 4), (3, 5), (3, 12),
(4, 9), (4, 8),
(5, 1), (5, 4), (5, 10),
(6, 4), (6, 5), (6, 10),
(7, 8), (7, 9), (7, 12),
(8, 9), (8, 5),
(9, 9), (9, 11),
(10, 3), (10, 6), (10, 7),
(11, 8), (11, 9),
(12, 4), (12, 5),
(13, 9), (13, 12),
(14, 2), (14, 3), (14, 10),
(15, 9),
(16, 1), (16, 4), (16, 10),
(17, 12), (17, 4),
(18, 10), (18, 12),
(19, 3), (19, 6), (19, 11),
(20, 4), (20, 10);

INSERT INTO contact_interactions
(alumni_id, interaction_type_id, interaction_date, notes, follow_up_needed)
VALUES
(1, 1, '2025-09-10', 'Sent invitation to CTIS career panel.', FALSE),
(2, 3, '2025-09-12', 'Asked about cybersecurity guest speaker availability.', TRUE),
(3, 1, '2025-08-22', 'Requested updated employment information.', FALSE),
(4, 2, '2025-07-18', 'Discussed networking internship opportunities.', TRUE),
(5, 6, '2025-10-01', 'Completed alumni outcomes survey.', FALSE),
(6, 1, '2025-10-03', 'Requested permission to feature career story.', TRUE),
(7, 5, '2025-11-05', 'Attended CTIS alumni networking event.', FALSE),
(8, 2, '2025-06-14', 'Phone call about mentoring current students.', FALSE),
(9, 1, '2025-05-02', 'Sent re-engagement email to former student.', TRUE),
(10, 3, '2025-09-28', 'LinkedIn message about software development panel.', FALSE),
(11, 1, '2025-10-11', 'Requested updated certification information.', TRUE),
(12, 6, '2025-08-15', 'Completed department survey.', FALSE),
(13, 1, '2025-04-20', 'Asked about transfer institution and current role.', TRUE),
(14, 5, '2025-11-05', 'Attended career night as alumni speaker.', FALSE),
(15, 1, '2025-03-08', 'Email bounced; contact info may be outdated.', TRUE),
(16, 2, '2025-10-22', 'Discussed healthcare data career path.', FALSE),
(17, 3, '2025-09-30', 'Asked about consulting internship referrals.', TRUE),
(18, 1, '2025-07-25', 'Sent alumni newsletter.', FALSE),
(19, 2, '2025-11-12', 'Current student/alumni candidate follow-up.', TRUE),
(20, 6, '2025-08-01', 'Completed employment outcomes survey.', FALSE);

-- =========================
-- QUICK CHECKS
-- =========================

SELECT COUNT(*) AS alumni_count FROM alumni;
SELECT COUNT(*) AS employer_count FROM employers;
SELECT COUNT(*) AS enrollment_count FROM alumni_program_enrollments;
SELECT COUNT(*) AS employment_count FROM employment_history;
SELECT COUNT(*) AS contact_count FROM contact_interactions;

SELECT * FROM view_current_employment;
SELECT * FROM view_alumni_by_industry;
SELECT * FROM view_follow_up_needed;