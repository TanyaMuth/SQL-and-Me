/******************
Registration Database
INFO 1620
Written by Lisa Thoendel
Last Updated Summer 2022
******************/

/*
Tanya Muth
*/

/****
The below code will create a database for us to work with. 
Copy and paste this code to the DDL pane of SQL Fiddle.

--<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>--

Creation Code. DO NOT EDIT!

****/
CREATE TABLE Student
	(StudentID	integer 		NOT NULL,
    StudentName	VARCHAR(25),
	CONSTRAINT Student_PK PRIMARY KEY (StudentID));
	
CREATE TABLE Course
  (CourseID		CHAR(8)			NOT NULL,
  CourseName	VARCHAR(35),
  CONSTRAINT Course_PK PRIMARY KEY (CourseID));

CREATE TABLE Section
  (SectionNo	integer 		NOT NULL,
  Semester		CHAR(7)			NOT NULL,
  CourseID		CHAR(8),
  CONSTRAINT Section_PK PRIMARY KEY(SectionNo),
  CONSTRAINT Section_FK FOREIGN KEY (CourseID)
    REFERENCES Course (CourseID));
	
CREATE TABLE Registration
  (StudentID 	integer 		NOT NULL,
  SectionNo		integer 		NOT NULL,
  CONSTRAINT IsRegistered_PK PRIMARY KEY (StudentID, SectionNo),
  CONSTRAINT StudentIsRegistered_FK 
    FOREIGN KEY(StudentID) 
	REFERENCES Student(StudentID),
  CONSTRAINT CourseIsRegistered_FK 
	FOREIGN KEY (SectionNo) 
	REFERENCES Section(SectionNo));
	
/***
Insert statements to give us data to work with.
DO NOT EDIT!
***/

insert 
into Student (StudentID, StudentName)
values (3, "Beth"), 
    (4, "Elliot"),
    (5, "James"),
    (6, "Clare"),
    (7, "Sophie");

insert into Course (CourseID, CourseName)
values ('INFO1620', 'Introduction to Database'),
    ('INFO1003', 'Problem Solving'),
    ('INFO1002', 'Introduction to IT'),
    ('INFO2630', 'SQL'),
    ('MATH1410', 'Statistics');

insert into Section (SectionNo, Semester, CourseID)
values (1,'FA22','INFO1620'),
    (2,'FA22','INFO1620'),
    (3,'FA22','INFO1003'),
    (4,'FA22','INFO1002'),
    (5,'FA22','INFO1002'),
    (6,'FA22','MATH1410');

insert into Registration (StudentID, SectionNo)
values (3,1),
    (3,3),
    (3,5),
    (4,1),
    (4,3),
    (5,4),
    (5,3),
    (6,6);

/* Test Code: Execute in query pane */
select * from Student;
select * from Course;
select * from Section;
select * from Registration;
