Task 7: Creating Views
# Objective

To learn how to create and use SQL Views for abstraction, reusability, and simplified query writing.

# Tools Used

MySQL Workbench 

MySQL 8.0

Windows 11

# Description

A View in SQL is a virtual table created from the result of a SELECT query.
It is useful for:

Simplifying complex queries

Providing restricted data access for security

Reusing SQL logic multiple times without rewriting queries

#Database Setup
Step 1 – Create Students Table
CREATE TABLE Student(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Class VARCHAR(10),
    City VARCHAR(30)
);

INSERT INTO Student VALUES
(1, 'Ananya', '10A', 'Delhi'),
(2, 'Karan', '9B', 'Mumbai'),
(3, 'Meera', '10A', 'Chennai'),
(4, 'Rohit', '9B', 'Kolkata');

Step 2 – Create Marks Table
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(30),
    MarksObtained INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Marks VALUES
(101, 1, 'Math', 88),
(102, 1, 'Science', 92),
(103, 2, 'Math', 75),
(104, 3, 'Science', 89),
(105, 4, 'Math', 68);

Step 3 – Create View
CREATE VIEW StudentMarksView AS
SELECT s.StudentName, s.Class, s.City, m.Subject, m.MarksObtained
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID;

# View Usage Examples
-- Show all student marks
SELECT * FROM StudentMarksView;

-- Show only Class 10A students
SELECT * FROM StudentMarksView
WHERE Class = '10A';

-- Show students scoring above 80
SELECT * FROM StudentMarksView
WHERE MarksObtained > 80;

 # Additional Queries
-- 1. Top scoring student in each subject
SELECT Subject, StudentName, MarksObtained
FROM StudentMarksView
WHERE MarksObtained IN (
    SELECT MAX(MarksObtained) FROM Marks GROUP BY Subject
);

-- 2. Average marks per class
SELECT Class, AVG(MarksObtained) AS AverageMarks
FROM StudentMarksView
GROUP BY Class;

-- 3. Students scoring below 70
SELECT * FROM StudentMarksView
WHERE MarksObtained < 70;

# Outcome

Created a view using CREATE VIEW

Fetched and filtered data using the view

Wrote additional queries to analyze data efficiently

