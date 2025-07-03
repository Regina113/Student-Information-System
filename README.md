# Student-Information-System
🎓 Student Information System – SQL Project
📘 Project Overview
This project simulates a Student Information System (SIS) using SQL. It provides a comprehensive backend structure for managing student data, including course enrollment, grades, faculty, and departments. The goal is to create a scalable and efficient database model to support common academic processes within a university or college setting.

🛠 Features
Create and manage student records

Assign students to courses and track enrollment

Store and retrieve grades and GPA

Link courses to instructors and departments

Query data for performance analytics and reporting

🗃️ Database Structure
Key Tables:
Students: Stores student info (StudentID, Name, DOB, Email, etc.)

Courses: Course catalog (CourseID, CourseName, CreditHours, etc.)

Instructors: Faculty details (InstructorID, Name, DepartmentID)

Departments: Academic departments

Enrollments: Many-to-many relation between Students and Courses

Grades: Tracks academic performance

Entity-Relationship Highlights:
One-to-many: Department ➝ Courses, Instructors

Many-to-many: Students ⇄ Courses (via Enrollments)

One-to-many: Instructors ➝ Courses

📊 Example Business Questions
Which students are currently enrolled in more than 3 courses?

What is the average GPA per department?

Which courses have the highest failure rates?

List all students who have taken a specific course.

💡 Sample Queries
sql
Copy
Edit
-- List all students enrolled in 'Database Systems'
SELECT s.StudentName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Database Systems';
🧪 Technologies Used
SQL (MySQL/PostgreSQL) – Core database operations

ERD Tools – For visualizing relationships

Power BI (optional) – For dashboards and data visualization

🚀 How to Use
Clone the repo

Run the Create_Tables.sql script

Use Insert_Data.sql to populate with sample data

Run queries in Business_Questions.sql for insights

📁 File Structure
pgsql
Copy
Edit
├── Create_Tables.sql
├── Insert_Data.sql
├── Business_Questions.sql
├── ERD_Diagram.png
└── README.md
📌 Future Improvements
Add login and authentication layers

Introduce stored procedures and triggers

Build a front-end interface for non-technical users

📝 Author
Regina Mayiie Kamara
Feel free to connect or ask questions!
