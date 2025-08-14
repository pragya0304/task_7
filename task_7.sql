create database school;
use school;

create table Student(
StudentID int primary  key ,
StudentName varchar(20),
Class varchar(20),
City varchar(10)
);

insert into Student(StudentID, StudentName,Class,City)values(1,"Arun","10A","Jaipur"),
(2,"Aarvik","9A","Delhi"),
(3,"Aanayara","10A","Mumbai"),
(4,"Bhavyansh","9B","Chennai");

-- Marks Table
create table Marks(
MarkID int primary key,
StudentID int,
Subject varchar(20),
MarksObtained int,
foreign key (StudentID)references Student(StudentID)
);

insert into Marks(MarkID, StudentID, Subject, MarksObtained)values(101, 1, 'Math', 88),
(102, 1, 'Science', 92),
(103, 2, 'Math', 75),
(104, 3, 'Science', 89),
(105, 4, 'Math', 68);

CREATE VIEW StudentMarksView AS
SELECT s.StudentName, s.Class, s.City, m.Subject, m.MarksObtained
FROM Student s
JOIN Marks m ON s.StudentID = m.StudentID;

-- Show all student marks
SELECT * FROM StudentMarksView;

-- Show only students from Class 10A
SELECT * FROM StudentMarksView
WHERE Class = '10A';

-- Show students scoring above 80 marks
SELECT * FROM StudentMarksView
WHERE MarksObtained > 80;

SELECT Subject, StudentName, MarksObtained
FROM StudentMarksView
WHERE MarksObtained IN (
    SELECT MAX(MarksObtained) 
    FROM Marks 
    GROUP BY Subject
);

SELECT Class, AVG(MarksObtained) AS AverageMarks
FROM StudentMarksView
GROUP BY Class;

SELECT * 
FROM StudentMarksView
WHERE MarksObtained < 70;

