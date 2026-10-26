# SEN307 Database Systems
## Week 4 Practical: Database Design and Normalization

### 1. Original Unnormalized Registration Data

The original registration sheet contains student information, department details, course information, lecturer details, and academic session records within a combined structure. This arrangement may result in repeated data, unnecessary duplication, and insertion, update, and deletion anomalies.

### 2. First Normal Form (1NF)

The database satisfies First Normal Form when each field contains a single, atomic value, each record can be uniquely identified, and repeating groups are eliminated.

To achieve 1NF, each student-course registration is recorded as a separate row. Student, course, and lecturer information is represented using individual values rather than lists of multiple values within a single field.

### 3. Second Normal Form (2NF)

Second Normal Form requires the database to satisfy 1NF and ensures that every non-key attribute depends on the entire candidate key rather than only part of a composite key.

Student details, such as matriculation number and full name, depend on the student identifier. Similarly, course details depend on the course identifier. Separating these details from registration records eliminates partial dependencies and reduces data duplication.

### 4. Third Normal Form (3NF)

Third Normal Form requires the database to satisfy 2NF and eliminates transitive dependencies, ensuring that non-key attributes depend directly on the key, the whole key, and nothing but the key.

The final database design consists of the following tables:

**Department**

- `dept_id` — Primary Key
- `dept_name` — Department name

**Student**

- `student_id` — Primary Key
- `matric_no` — Student matriculation number
- `full_name` — Student's full name
- `dept_id` — Foreign Key referencing `Department(dept_id)`

**Lecturer**

- `lecturer_id` — Primary Key
- `lecturer_name` — Lecturer's name
- `dept_id` — Foreign Key referencing `Department(dept_id)`

**Course**

- `course_id` — Primary Key
- `course_code` — Unique course code
- `course_title` — Course title
- `dept_id` — Foreign Key referencing `Department(dept_id)`

**Enrolment**

- `enrolment_id` — Primary Key
- `student_id` — Foreign Key referencing `Student(student_id)`
- `course_id` — Foreign Key referencing `Course(course_id)`
- `session` — Academic session

**Teaching**

- `teaching_id` — Primary Key
- `lecturer_id` — Foreign Key referencing `Lecturer(lecturer_id)`
- `course_id` — Foreign Key referencing `Course(course_id)`
- `session` — Academic session

This design reduces redundancy by storing department, student, lecturer, and course information separately. The `Enrolment` and `Teaching` tables resolve many-to-many relationships while maintaining referential integrity through foreign keys.

### 5. Relationships and Cardinalities

The database contains the following relationships:

- **Department to Student (1:M):** One department can have many students, while each student belongs to one department.
- **Department to Lecturer (1:M):** One department can have many lecturers, while each lecturer belongs to one department.
- **Department to Course (1:M):** One department can offer many courses, while each course belongs to one department.
- **Student to Course (M:N):** A student can enrol in many courses, and a course can have many students. The `Enrolment` table resolves this relationship.
- **Lecturer to Course (M:N):** A lecturer can teach multiple courses, and a course can be taught by multiple lecturers. The `Teaching` table resolves this relationship.

The resulting schema provides a structured and consistent database design that reduces data duplication, prevents common data anomalies, and supports reliable relationships between academic records.