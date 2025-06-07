CREATE TABLE Departments (
       DepartmentID INT PRIMARY KEY,
       Name VARCHAR(100)
);

CREATE TABLE Instructors (
       InstructorID INT PRIMARY KEY,
       Name VARCHAR(100),
       DepartmentID INT,
       FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
       CourseID INT PRIMARY KEY,
       Name VARCHAR(100),
       CreditHours INT,
       DepartmentID INT,
       InstructorID INT,
       FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
       FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Students (
       StudentID INT PRIMARY KEY,
       Name VARCHAR(100),
       DOB DATE,
       Email VARCHAR(100),
       MajorID INT,
       FOREIGN KEY (MajorID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
       EnrollmentID INT PRIMARY KEY,
       StudentID INT,
       CourseID INT,
       Semester VARCHAR(20),
       Year INT,
       FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
       FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Grades (
       GradeID INT PRIMARY KEY,
       EnrollmentID INT,
       LetterGrade CHAR(2),
       FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

-- Departments
INSERT INTO Departments(DepartmentID, Name)
            VALUES(1, 'Computer Science');
INSERT INTO Departments(DepartmentID, Name)
            VALUES(2, 'Mathematics');
INSERT INTO Departments(DepartmentID, Name)
            VALUES(3, 'Physics');
INSERT INTO Departments(DepartmentID, Name)
            VALUES(4, 'English');
INSERT INTO Departments(DepartmentID, Name)
            VALUES(5, 'Business');

-- Instructors
INSERT INTO Instructors(InstructorID, Name, DepartmentID)
            VALUES(1, 'Dr. Alice Newton', 1);
INSERT INTO Instructors(InstructorID, Name, DepartmentID)
            VALUES(2, 'Prof. Brian Keene', 2);
INSERT INTO Instructors(InstructorID, Name, DepartmentID)
            VALUES(3, 'Dr. Carla Pierce', 3);
INSERT INTO Instructors(InstructorID, Name, DepartmentID)
            VALUES(4, 'Dr. Daniel Ross', 4);
INSERT INTO Instructors(InstructorID, Name, DepartmentID)
            VALUES(5, 'Prof. Ellen Chase', 5);

-- Courses
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(101, 'Database Systems', 3, 1, 1);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(102, 'Algorithms', 3, 1, 1);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(201, 'Calculus I', 4, 2, 2);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(202, 'Linear Algebra', 3, 2, 2);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(301, 'Classical Mechanics', 4, 3, 3);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(401, 'Shakespearean Literature', 3, 4, 4);
INSERT INTO Courses(CourseID, Name, CreditHours, DepartmentID, InstructorID)
            VALUES(501, 'Marketing 101', 3, 5, 5);

-- Students
INSERT INTO Students(StudentID, Name, DOB, Email, MajorID)
            VALUES(1, 'Jane Doe', '2002-05-12', 'jane@example.com', 1);
INSERT INTO Students(StudentID, Name, DOB, Email, MajorID)
            VALUES(2, 'Mark Lee', '2001-11-03', 'mark@example.com', 1);
INSERT INTO Students(StudentID, Name, DOB, Email, MajorID)
            VALUES(3, 'Sasha Kim', '2003-01-22', 'sasha@example.com', 2);
INSERT INTO Students(StudentID, Name, DOB, Email, MajorID)
            VALUES(4, 'Tariq Nia', '2002-07-19', 'tariq@example.com', 5);
INSERT INTO Students(StudentID, Name, DOB, Email, MajorID)
            VALUES(5, 'Emily Stone', '2000-03-14', 'emily@example.com', 4);

-- Enrollments
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(1, 1, 101, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(2, 1, 102, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(3, 1, 201, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(4, 1, 202, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(5, 2, 101, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(6, 2, 102, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(7, 3, 201, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(8, 3, 202, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(9, 3, 301, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(10, 4, 401, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(11, 5, 401, 'Spring', 2024);
INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, Semester, Year)
            VALUES(12, 5, 501, 'Spring', 2024);

-- Grades
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(1, 1, 'A');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(2, 2, 'B');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(3, 3, 'C');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(4, 4, 'F');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(5, 5, 'A');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(6, 6, 'B');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(7, 7, 'D');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(8, 8, 'F');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(9, 9, 'C');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(10, 10, 'B');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(11, 11, 'A');
INSERT INTO Grades(GradeID, EnrollmentID, LetterGrade)
            VALUES(12, 12, 'A');
       