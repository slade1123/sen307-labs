USE sen307_12219;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM teaching;
DELETE FROM CourseAllocation;
DELETE FROM Enrolment;
DELETE FROM Student;
DELETE FROM Course;
DELETE FROM Lecturer;
DELETE FROM Department;

ALTER TABLE CourseAllocation AUTO_INCREMENT = 1;
ALTER TABLE Enrolment  AUTO_INCREMENT = 1;
ALTER TABLE Student  AUTO_INCREMENT = 1;
ALTER TABLE Course AUTO_INCREMENT = 1;
ALTER TABLE Lecturer AUTO_INCREMENT = 1;
ALTER TABLE Department AUTO_INCREMENT = 1;

SET SQL_SAFE_UPDATES = 1;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, dept_id)
SELECT x.course_code, x.course_title,
       (SELECT dept_id FROM Department WHERE dept_name = x.dept_name)
FROM (
            SELECT 'SEN307' AS course_code, 'Database Systems' AS course_title,
                   'Software Engineering' AS dept_name UNION ALL
            SELECT 'SEN301','Software Architecture','Software Engineering'      UNION ALL
            SELECT 'COS301','Operating Systems','Computer Science'               UNION ALL
            SELECT 'COS305','Computer Networks','Computer Science'               UNION ALL
            SELECT 'AIN301','Introduction to Artificial Intelligence','Artificial Intelligence' UNION ALL
            SELECT 'AIN305','Machine Learning','Artificial Intelligence'         UNION ALL
            SELECT 'AIN307','Natural Language Processing','Artificial Intelligence' UNION ALL
            SELECT 'DTS301','Data Visualization and Analytics','Data Science'    UNION ALL
            SELECT 'DTS305','Big Data Technologies','Data Science'               UNION ALL
            SELECT 'CYB301','Network Security','Cybersecurity'
) x;

SET @se  = (SELECT dept_id FROM Department WHERE dept_name='Software Engineering');
SET @cs  = (SELECT dept_id FROM Department WHERE dept_name='Computer Science');
SET @ai  = (SELECT dept_id FROM Department WHERE dept_name='Artificial Intelligence');
SET @ds  = (SELECT dept_id FROM Department WHERE dept_name='Data Science');
SET @cyb = (SELECT dept_id FROM Department WHERE dept_name='Cybersecurity');

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101','Dr Amaka Okafor',   'a.okafor@vua.edu.ng',   @se),
('VUA/ST/102','Dr Musa Bello',     'm.bello@vua.edu.ng',    @se),
('VUA/ST/103','Dr Ngozi Eze',      'n.eze@vua.edu.ng',      @cs),
('VUA/ST/104','Dr Tunde Adeyemi',  't.adeyemi@vua.edu.ng',  @cs),
('VUA/ST/105','Dr Fatima Yusuf',   'f.yusuf@vua.edu.ng',    @ai),
('VUA/ST/106','Dr Emeka Nwosu',    'e.nwosu@vua.edu.ng',    @ai),
('VUA/ST/107','Dr Aisha Abubakar', 'a.abubakar@vua.edu.ng', @ds),
('VUA/ST/108','Dr Segun Adebayo',  's.adebayo@vua.edu.ng',  @ds),
('VUA/ST/109','Dr Chidinma Obi',   'c.obi@vua.edu.ng',      @cyb),
('VUA/ST/110','Dr Ibrahim Sani',   'i.sani@vua.edu.ng',     @cyb);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('20231234','Ada Obi',  'F','2005-03-14',@se),
('20231235','John Musa', 'M','2004-11-02',@cs),
('12219',' Achine Bryan', 'M','2007-10-31',@se),
('20231237','Emeka Okafor','M','2006-01-15',@ai),
('20231238','Fatima Bello','F','2005-09-30',@cs),
('20231239','Chidi Eze','M','2004-04-18',@ds),
('20231240','Ngozi Nwosu','F','2006-12-05',@ai),
('20231241','Tunde Adebayo','M','2003-08-22',@se),
('20231242','Aisha Yusuf','F','2007-02-11',@cyb),
('20231243','Segun Ojo','M','2005-06-09',@cs),
('20231244','Chidinma Obi','F','2004-10-27',@ds),
('20231245','Ibrahim Sani','M','2006-03-03',@cyb),
('20231246','Yetunde Lawal','F','2003-05-16',@se),
('20231247','Musa Abubakar','M','2005-12-20',@ai),
('20231248','Halima Mohammed','F','2007-01-08',@ds),
('20231249','Kelechi Uche','M','2004-09-14',@cs),
('20231250','Bola Ogunleye','F','2006-07-25',@cyb),
('20231251','Ifeanyi Nnaji','M','2003-11-30',@se),
('20231252','Zainab Ali','F','2005-04-07',@ai),
('20231253','Daniel Osei','M','2004-02-19',@ds);

INSERT INTO Enrolment (student_id, course_id)
SELECT s.student_id, c.course_id
FROM Student s JOIN Course c
WHERE (s.matric_no, c.course_code) IN (
 ('20231234','SEN307'),('20231235','SEN307'),('20231236','SEN307'),('20231237','SEN307'),
 ('20231238','SEN307'),('20231239','SEN307'),('20231240','SEN307'),('20231241','SEN307'),
 ('20231234','SEN301'),('20231235','SEN301'),('20231242','SEN301'),('20231243','SEN301'),('20231244','SEN301'),
 ('20231236','COS301'),('20231237','COS301'),('20231245','COS301'),('20231246','COS301'),
 ('20231238','COS305'),('20231239','COS305'),('20231247','COS305'),('20231248','COS305'),
 ('20231234','AIN301'),('20231240','AIN301'),('20231249','AIN301'),('20231250','AIN301'),
 ('20231235','AIN305'),('20231241','AIN305'),('20231251','AIN305'),
 ('20231236','AIN307'),('20231242','AIN307'),('20231245','AIN307'),
 ('20231237','DTS301'),('20231243','DTS301'),('20231249','DTS301'),
 ('20231238','DTS305'),('20231244','DTS305'),('20231246','DTS305'),
 ('20231239','CYB301'),('20231247','CYB301'),('20231250','CYB301'));

INSERT INTO CourseAllocation (course_id, lecturer_id)
SELECT c.course_id, l.lecturer_id
FROM Course c JOIN Lecturer l
WHERE (c.course_code, l.staff_no) IN (
 ('SEN307','VUA/ST/101'),('SEN307','VUA/ST/102'),('SEN301','VUA/ST/101'),
 ('COS301','VUA/ST/103'),('COS305','VUA/ST/104'),('AIN301','VUA/ST/105'),
 ('AIN305','VUA/ST/106'),('AIN307','VUA/ST/105'),('DTS301','VUA/ST/107'),
 ('DTS305','VUA/ST/108'),('CYB301','VUA/ST/109'));

INSERT INTO teaching (lecturer_id, course_id)
SELECT ca.lecturer_id, ca.course_id FROM CourseAllocation ca;

SET SQL_SAFE_UPDATES = 0;
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
UPDATE Student SET dept_id = (SELECT dept_id FROM Department WHERE dept_name='Computer Science')
WHERE matric_no = '20231234';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id)
VALUES ('20239999','Transfer Student','M','2005-01-15',
        (SELECT dept_id FROM Department WHERE dept_name='Library and Information Science'));

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Department WHERE dept_name = 'Library and Information Science';

USE sen307_12219;

SET @se  = (SELECT dept_id FROM Department WHERE dept_name='Software Engineering');
SET @cs  = (SELECT dept_id FROM Department WHERE dept_name='Computer Science');
SET @ai  = (SELECT dept_id FROM Department WHERE dept_name='Artificial Intelligence');
SET @ds  = (SELECT dept_id FROM Department WHERE dept_name='Data Science');
SET @cyb = (SELECT dept_id FROM Department WHERE dept_name='Cybersecurity');

INSERT INTO Lecturer (lecturer_name, dept_id) VALUES
('Dr Amaka Okafor',   @se),
('Dr Musa Bello',     @se),
('Dr Ngozi Eze',      @cs),
('Dr Tunde Adeyemi',  @cs),
('Dr Fatima Yusuf',   @ai),
('Dr Emeka Nwosu',    @ai),
('Dr Aisha Abubakar', @ds),
('Dr Segun Adebayo',  @ds),
('Dr Chidinma Obi',   @cyb),
('Dr Ibrahim Sani',   @cyb);

INSERT INTO Student (matric_no, full_name, dept_id) VALUES
('20231234','Ada Obi',          @se),
('20231235','John Musa',        @cs),
('20231236','Blessing Adeyemi', @se),
('20231237','Emeka Okafor',     @ai),
('20231238','Fatima Bello',     @cs),
('20231239','Chidi Eze',        @ds),
('20231240','Ngozi Nwosu',      @ai),
('20231241','Tunde Adebayo',    @se),
('20231242','Aisha Yusuf',      @cyb),
('20231243','Segun Ojo',        @cs),
('20231244','Chidinma Obi',     @ds),
('20231245','Ibrahim Sani',     @cyb),
('20231246','Yetunde Lawal',    @se),
('20231247','Musa Abubakar',    @ai),
('20231248','Halima Mohammed',  @ds),
('20231249','Kelechi Uche',     @cs),
('20231250','Bola Ogunleye',    @cyb),
('20231251','Ifeanyi Nnaji',    @se),
('20231252','Zainab Ali',       @ai),
('20231253','Daniel Osei',      @ds);

INSERT INTO Enrolment (student_id, course_id)
SELECT s.student_id, c.course_id
FROM Student s JOIN Course c
WHERE (s.matric_no, c.course_code) IN (
 ('20231234','SEN307'),('20231235','SEN307'),('20231236','SEN307'),('20231237','SEN307'),
 ('20231238','SEN307'),('20231239','SEN307'),('20231240','SEN307'),('20231241','SEN307'),
 ('20231234','SEN301'),('20231235','SEN301'),('20231242','SEN301'),('20231243','SEN301'),('20231244','SEN301'),
 ('20231236','COS301'),('20231237','COS301'),('20231245','COS301'),('20231246','COS301'),
 ('20231238','COS305'),('20231239','COS305'),('20231247','COS305'),('20231248','COS305'),
 ('20231234','AIN301'),('20231240','AIN301'),('20231249','AIN301'),('20231250','AIN301'),
 ('20231235','AIN305'),('20231241','AIN305'),('20231251','AIN305'),
 ('20231236','AIN307'),('20231242','AIN307'),('20231245','AIN307'),
 ('20231237','DTS301'),('20231243','DTS301'),('20231249','DTS301'),
 ('20231238','DTS305'),('20231244','DTS305'),('20231246','DTS305'),
 ('20231239','CYB301'),('20231247','CYB301'),('20231250','CYB301'));

INSERT INTO CourseAllocation (course_id, lecturer_id)
SELECT c.course_id, l.lecturer_id
FROM Course c JOIN Lecturer l
WHERE (c.course_code, l.lecturer_name) IN (
 ('SEN307','Dr Amaka Okafor'),('SEN307','Dr Musa Bello'),('SEN301','Dr Amaka Okafor'),
 ('COS301','Dr Ngozi Eze'),('COS305','Dr Tunde Adeyemi'),('AIN301','Dr Fatima Yusuf'),
 ('AIN305','Dr Emeka Nwosu'),('AIN307','Dr Fatima Yusuf'),('DTS301','Dr Aisha Abubakar'),
 ('DTS305','Dr Segun Adebayo'),('CYB301','Dr Chidinma Obi'));

INSERT INTO teaching (lecturer_id, course_id)
SELECT ca.lecturer_id, ca.course_id FROM CourseAllocation ca;

SET SQL_SAFE_UPDATES = 0;
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
UPDATE Student SET dept_id = (SELECT dept_id FROM Department WHERE dept_name='Computer Science')
WHERE matric_no = '20231234';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999','Transfer Student',
        (SELECT dept_id FROM Department WHERE dept_name='Library and Information Science'));

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Department WHERE dept_name = 'Library and Information Science';



UPDATE Student SET dept_id = (SELECT dept_id FROM Department WHERE dept_name='Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers',  COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students',   COUNT(*) FROM Student
UNION ALL SELECT 'Courses',    COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations',COUNT(*) FROM CourseAllocation
UNION ALL SELECT 'teaching',   COUNT(*) FROM teaching;