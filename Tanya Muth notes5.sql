/******************
Module 5: Intro to SQL
INFO 1620
Written by Lisa Thoendel
Last Updated Summer 2022

Name: Tanya Muth

--<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>--

Use the Registration create script to answer these questions.
We will use the below area to write our test SQL.

******************/

/* 1) How would you add a grade attribute (Char with length 1)
      to the Registration table? */

ALTER TABLE Registration
ADD COLUMN Grade char(1); 

SELECT *
FROM Registration;


/* 2) How would you remove Elliot's registration to INFO 1003? */

/*Elliot is student ID4; INFO 1003 is section number 3*/

SELECT *
FROM Registration
WHERE StudentID = 4 AND SectionNo = 3;

/*DELETE*/
DELETE
FROM Registration
WHERE StudentID = 4 AND SectionNo = 3;


/* 3) How would you create a new MathCourses table? */

CREATE TABLE MathCourses
(CourseID char(8) not null primary key,
CourseName varchar(35))
;

/* 4) How would you insert MATH1315 College Algebra to the MathCourses table? */
  
INSERT INTO MathCourses (CourseID, CourseName)
VALUES (‘MATH1315’,”College Algebra”);

/* 5) How would you show the rows of the MathCourses table to make sure you
     inserted MATH1315 successfully? */

SELECT *
FROM MathCourses;

/* 6) How would you remove the MathCourses table? */

DELETE *
FROM MathCourses;

SHOW TABLES;

DROP TABLE MathCourses;


/* 7) Show which Section has the most registrations. */

SELECT SectionNo, COUNT(StudentID)
FROM Registration
GROUP BY SectionNo
;

/* 8) Show which Student has the highest ID number. */

SELECT MAX(StudentID)
FROM Student
;

/* 9) Show the Courses in alphabetical order by CourseID */

/*
SELECT
FROM 
WHERE
GROUP BY
HAVING
ORDER BY

SWEATY
FEET
WILL
GIVE
HORRIBLE
ODORS
*/

SELECT *
FROM Course
ORDER BY CourseID
;

/* 10) Which students are registered for a section? */

SELECT *
FROM Student
  JOIN Registration on Registration.StudentID = Student.StudentID
;

/* 
This can also be written as seen below, but is not best practice and can have limitations, and you don’t have the ability to specify a join type:

SELECT *
FROM Student, Registration
WHERE Registration.StudentID = Student.StudentID
;

*/

/* 11) How many classes are each student registered for? */

/*
Student Name is only found in the Student table, so the specification of “student.” Before StudentName is totally necessary
*/

SELECT Student.StudentID, Student.StudentName, COUNT(*) AS ‘# of Courses’
FROM Student
  JOIN Registration on Registration.StudentID = Student.StudentID
GROUP BY Student.StudentID
;
