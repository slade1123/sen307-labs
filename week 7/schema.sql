USE sen307_12219;
CREATE TABLE Department (
dept_id INT PRIMARY KEY AUTO_INCREMENT,
dept_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Lecturer (
lecturer_id INT PRIMARY KEY AUTO_INCREMENT,
staff_no VARCHAR(20) NOT NULL UNIQUE,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
dept_id INT NOT NULL,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Student (
student_id INT PRIMARY KEY AUTO_INCREMENT,
matric_no VARCHAR(20) NOT NULL UNIQUE,
full_name VARCHAR(100) NOT NULL,
gender ENUM('M','F'),
date_of_birth DATE,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Course (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_code VARCHAR(10) NOT NULL UNIQUE,
course_title VARCHAR(150) NOT NULL,
credit_units TINYINT NOT NULL DEFAULT 3,
description TEXT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Enrolment (
enrolment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT NOT NULL,
course_id INT NOT NULL,
academic_session VARCHAR(9) NOT NULL DEFAULT '2026/2027',
semester ENUM('First','Second') NOT NULL DEFAULT 'First',
enrolled_on DATE DEFAULT (CURRENT_DATE),
UNIQUE (student_id, course_id, academic_session),
FOREIGN KEY (student_id) REFERENCES Student(student_id),
FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
CREATE TABLE CourseAllocation (
allocation_id INT PRIMARY KEY AUTO_INCREMENT,
course_id INT NOT NULL,
lecturer_id INT NOT NULL,
academic_session VARCHAR(9) NOT NULL DEFAULT '2026/2027',
UNIQUE (course_id, lecturer_id, academic_session),
FOREIGN KEY (course_id) REFERENCES Course(course_id),
FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id)
);
ALTER TABLE Student ADD COLUMN phone VARCHAR(15) AFTER full_name;
ALTER TABLE Course ADD CONSTRAINT chk_credit_units CHECK (credit_units BETWEEN 1 AND 6);

USE sen307_12219;
INSERT INTO Department (dept_name) VALUES (NULL);
INSERT INTO Course (course_code, course_title, credit_units) VALUES ('TST101', 'Test', 9);
INSERT INTO Student (matric_no, full_name, dept_id) VALUES ('TEST001', 'Test', 999);
INSERT INTO Student (matric_no, full_name, gender) VALUES ('TEST002', 'Test', 'X');

SELECT COUNT(*) FROM Department;
SELECT COUNT(*) FROM Course;
SELECT COUNT(*) FROM Student;


INSERT INTO Course (course_code, course_title, credit_units) VALUES ('TST102', 'Test', 3);
SHOW TABLES;
DESCRIBE Department;
DESCRIBE Lecturer;
DESCRIBE Student;
DESCRIBE Course;
DESCRIBE Enrolment;
DESCRIBE CourseAllocation;
SHOW CREATE TABLE Enrolment;

//in the second diagram, there is a new table called courseallocation and it has a relationship with both the lecturer and the course