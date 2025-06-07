-- Business Questions
-- 1. Which students are currently enrolled in more than three courses this semester?
SELECT Name, COUNT(CourseID) AS CourseCount
FROM Students JOIN Enrollments USING (StudentID)
WHERE Semester = 'Spring' AND Year = 2024
GROUP BY StudentID
HAVING COUNT(CourseID) > 3;

-- 2. How many unique courses is each instructor teaching this semester?
SELECT Instructors.Name, COUNT(CourseID) AS CourseCount
FROM Instructors JOIN Courses USING (InstructorID)
GROUP BY InstructorID;

-- 3. What is the average GPA of each student, and who are our top 5 performing students
-- overall?
SELECT Students.Name, ROUND(AVG(CASE Grades.LetterGrade
WHEN 'A' THEN 4
WHEN 'B' THEN 3
WHEN 'C' THEN 2
WHEN 'D' THEN 1
WHEN 'F' THEN 0 END), 2) AS GPA
FROM Students JOIN Enrollments USING (StudentID)
			  JOIN Grades USING (EnrollmentID)
GROUP BY StudentID
ORDER BY GPA DESC
LIMIT 5;

-- 4. What is the average GPA per department?
SELECT Departments.Name AS Department, ROUND(AVG(CASE Grades.LetterGrade
WHEN 'A' THEN 4
WHEN 'B' THEN 3
WHEN 'C' THEN 2
WHEN 'D' THEN 1
WHEN 'F' THEN 0 END), 2) AS AvgGPA
FROM Departments JOIN Students ON Departments.DepartmentID = Students.MajorID
                 JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
                 JOIN Grades ON Enrollments.EnrollmentID = Grades.EnrollmentID
GROUP BY Departments.DepartmentID;

-- 5. Which 5 courses have the highest student enrollment this semester?
SELECT Courses.Name, COUNT(Enrollments.StudentID) AS Enrollments
FROM Courses JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY Courses.CourseID
ORDER BY Enrollments DESC
LIMIT 5;

-- 6. List students who have failed at least two courses. 
SELECT Students.Name, COUNT(*) AS FailedCourses
FROM Students JOIN Enrollments USING (StudentID)
              JOIN Grades USING (EnrollmentID)
WHERE Grades.LetterGrade = 'F'
GROUP BY Students.StudentID
HAVING COUNT(*) >= 2;

-- 7. Which students have completed all courses required for their major (e.g., Computer
-- Science)?
SELECT Students.Name
FROM Students
WHERE Students.MajorID = 1
AND NOT EXISTS (
        SELECT Courses.CourseID
        FROM Courses
        WHERE Courses.CourseID IN (101, 102)
        EXCEPT
        SELECT Enrollments.CourseID
        FROM Enrollments
        JOIN Grades USING (EnrollmentID)
        WHERE Grades.LetterGrade IN ('A', 'B', 'C', 'D') AND Enrollments.StudentID = Students.StudentID
);
