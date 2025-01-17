/******************
Module 6: Advanced SQL
INFO 1620
Written by Lisa Thoendel
Last Updated Summer 2022

Tanya Muth 

--<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>--

Use the Registration create script to answer these questions.
We will use the below area to write our test SQL.

******************/
/* 1) Join student and course together with a natural join and select all rows. Note that this
    produces every possible combination of students and courses. There
    is not a PK/FK relationship between student and course - so this is
    the only possible join between the 2 tables.
*/

SELECT *
FROM Student, Course
;

/* 2) Now let's look at an inner join between students and registration.
    This will make use of the PK/FK relationship between these tables.
*/

SELECT s.StudentID, s.StudentName, r.StudentID, r.SectionNo 
FROM Student s
 JOIN Registration r 
 on s.StudentID = r.StudentID
;

/*  3) Next, let's add sections to the join - giving us a 3 way inner
    join. This means we'll see students that are registered for a section
    and sections that have students registered.
*/

SELECT *
FROM Student s 
 JOIN Registration r 
  on s.StudentID = r.StudentID
 JOIN Section x 
  ON x.SectionNo = r.SectionNo
;

/*  4) Suppose we want to see students that aren't registered yet though also.
    We'll need an outer join to accomplish that.
*/

SELECT *
FROM Student s
 LEFT OUTER JOIN Registration r ON s.StudentID = r.StudentID
;

/*  5) By using the NOT IN operator, we can target a list of students that are
    not registered only.
*/

SELECT *
FROM Student
WHERE StudentID NOT IN 
 (SELECT StudentID
 FROM Registration)
;

/*  6) Or we can use IN to create a kind of join by subquery. Select the student 
    names and IDs that are in INFO 1003
*/

SELECT StudentName
FROM Student
WHERE StudentID IN
 (
 SELECT StudentID
 FROM Registration
 WHERE SectionNo IN
  (
  SELECT SectionNo
  FROM Section
  WHERE CourseID = 'INFO1003'
  )
 )
;

/*  7) Another way to get this same result is by using NOT EXISTS.
*/

SELECT *
FROM Student
WHERE NOT EXISTS
 (
 SELECT *
 FROM Registration
 WHERE Registration.StudentID = Student.StudentID
 )
;

/*  8) Build a master schedule showing every student's names with the class
    names, numbers and sections they are registered for. Include the semester.
    This brings our whole schema together!
*/

SELECT StudentName, CourseName, c.CourseID, x.SectionNo, Semester
FROM Student s
 JOIN Registration r ON r.StudentID = s.StudentID
 JOIN Section x ON x.SectionNo = r.SectionNo
 JOIN Course c ON c.CourseID = x.CourseID 
;

/*  9) Over time,  you may find that you use a query very frequently or that
    you have a subset of users that need access to a particular query, but
    that shouldn't see the full tables behind that query. These are excellent
    use cases for a view! Build a view based on #8 called schedule.
*/

CREATE VIEW StudentSchedule
AS
SELECT StudentName, CourseName, c.CourseID, x.SectionNo, Semester
FROM Student s
 JOIN Registration r ON r.StudentID = s.StudentID
 JOIN Section x ON x.SectionNo = r.SectionNo
 JOIN Course c ON c.CourseID = x.CourseID 
;

/* 10) Query the schedule view for the courses Elliot *or* James are registered for.
*/

SELECT *
FROM StudentSchedule
WHERE StudentName = 'Elliot' OR StudentName = 'James'
;

/****************
This query can also be done the following way
***************************/

SELECT *
FROM StudentSchedule
WHERE StudentName IN ('Elliot', 'James')
;
