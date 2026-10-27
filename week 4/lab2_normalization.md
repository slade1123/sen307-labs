# Achine Bryan Berinyuy - VUG/SEN/24/12219 - VUA-SEN 307 



### Normalization from 1NF to 3NF

|matric\_no|student\_name|student\_dept|course\_codes|course\_titles|lecturers|lecturer\_depts|session|
|-|-|-|-|-|-|-|-|
|20231234|Ada Obi|Software Engineering|SEN307, SEN301|Database Systems, Software Architecture|Dr A. Okafor, Dr M. Bello|Software Eng., Software Eng.|2026/2027|
|20231235|John Musa|Computer Science|SEN307, CSC301|Database Systems, Operating Systems|Dr. A Okafor, Mrs F. Eze|Software Eng., Computer Sci.|2026/2027|
|20231236|Grace Okon|Software Engineering|SEN301|Software Architecture|Dr M. Bello|Software Eng.|2026/2027|



#### 1NF

The original table was converted to 1NF by separating multiple courses in a single cell into individual rows, with one row for each student–course pair

|matric\_no|student\_name|student\_dept|course\_codes|course\_titles|lecturers|lecturer\_depts|session|
|-|-|-|-|-|-|-|-|
|20231234|Ada Obi|Software Engineering|SEN307|Database Systems|Dr A. Okafor|Software Eng.,|2026/2027|
|20231234|Ada Obi|Software Engineering|SEN301|Software Architecture|Dr M. Bello|Software Eng.|2026/2027|
|20231235|John Musa|Computer Science|SEN307|Database Systems|Dr. A Okafor|Software Eng.|2026/2027|
|20231235|John Musa|Computer Science|CSC301|Operating Systems|Mrs F. Eze|Computer Sci.|2026/2027|
|20231236|Grace Okon|Software Engineering|SEN301|Software Architecture|Dr M. Bello|Software Eng.|2026/2027|





#### Second Normal Form (2NF)

The table was separated into Student, Course, and Enrolment tables to remove partial dependencies on parts of the composite key.

##### Student Table

|matric\_no|student\_name|student\_department|
|-|-|-|
|20231234|Ada Obi|Software Engineering|
|20231235|John Musa|Computer Science|
|20231236|Grace Okon|Softare Engineering|



##### Course Table

|course\_code|course\_title|lecturer|lecturer\_dept|
|-|-|-|-|
|SEN307|Database Systems|Dr A. Okafor|Software Eng.|
|SEN301|Software Architecture|Dr M. Bello|Software Eng.|
|CSC301|Operating Systems|Mrs F. Eze|Computer Sci.|



##### Enrolment Table

|matric\_no|course\_code|session|
|-|-|-|
|20231234|SEN307|2026/2027|
|20231234|SEN301|2026/2027|
|20231235|SEN307|2026/2027|
|20231235|CSC301|2026/2027|
|20231236|SEN301|2026/2027|





##### Step 3: Third Normal Form

Explanation: The tables were further separated to store department and lecturer details independently and to represent lecturer–course assignments through a TeachingAssignment table.

##### Student Table

|matric\_no|student\_name|department\_id|
|-|-|-|
|20231234|Ada Obi|D011|
|20231235|John Musa|D012|
|20231236|Grace Okon|D011|





##### Department Table

|department\_id|department|
|-|-|
|D011|Software Engineering|
|D012|Computer Science|



##### Lecturer Table

|lecturer\_id|lecturer|department\_id|
|-|-|-|
|L011|Dr A. Okafor|D011|
|L012|Dr M. Bello|D011|
|L013|Mrs F. Eze|D012|





##### Course Table

|course\_code|course\_title|
|-|-|
|SEN307|Database Systems|
|SEN301|Software Architecture|
|CSC301|Operating Systems|



##### Enrolment Table

|matric\_no|course\_code|session|
|-|-|-|
|20231234|SEN307|2026/2027|
|20231234|SEN301|2026/2027|
|20231235|SEN307|2026/2027|
|20231235|CSC301|2026/2027|
|20231236|SEN301|2026/2027|



##### Teaching Assignment Table

|lecturer\_id|course\_code|session|
|-|-|-|
|L011|SEN307|2026/2027|
|L012|SEN301|2026/2027|
|L013|CSC301|2026/2027|





##### Step 4: Write out your final Schema

Department (department\_id PK, department)

Student (matric\_no PK, student\_name, department\_id FK → Department)

Lecturer (lecturer\_id PK, lecturer, department\_id FK → Department)

Course (course\_code PK, course\_title)

Enrolment (matric\_no PK/FK → Student, course\_code PK/FK → Course, session PK)

TeachingAssignment (lecturer\_id PK/FK → Lecturer, course\_code PK/FK → Course, session PK)

