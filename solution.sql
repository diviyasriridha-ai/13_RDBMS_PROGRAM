CREATE DATABASE CollegeDB;

USE CollegeDB;

-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Values
INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Information Technology');

INSERT INTO Faculty VALUES
(1, 'Ravi', 101),
(2, 'Meena', 102);

INSERT INTO Course VALUES
(201, 'Database Systems', 1),
(202, 'Data Structures', 2);

INSERT INTO Student VALUES
(1001, 'Arun', 201),
(1002, 'Divya', 202),
(1003, 'Karthik', 201);

-- Display Normalized Data
SELECT 
    Student.StudentID,
    Student.StudentName,
    Course.CourseName,
    Faculty.FacultyName,
    Department.DepartmentName
FROM Student
JOIN Course
ON Student.CourseID = Course.CourseID
JOIN Faculty
ON Course.FacultyID = Faculty.FacultyID
JOIN Department
ON Faculty.DepartmentID = Department.DepartmentID;
