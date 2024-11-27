USE master ;


DROP DATABASE IF EXISTS UniversityDB;

GO


CREATE DATABASE UniversityDB;

GO

USE UniversityDB;

GO


CREATE SCHEMA STG;


CREATE SCHEMA Students;


CREATE SCHEMA Feedback;


CREATE SCHEMA HumanResources;


CREATE SCHEMA Courses;


CREATE SCHEMA StudentInteraction;

GO


CREATE TABLE HumanResources.Department (DID INT IDENTITY(1, 1),
                                                Dname NVARCHAR(100),
                                                      CONSTRAINT Dept_pk PRIMARY KEY (DID));

GO


INSERT INTO [HumanResources].[Department] ([Dname])
SELECT DISTINCT [department]
FROM [UniversityDB].[STG].[Data];

GO


CREATE TABLE Students.Student (Stud_ID INT, Sname NVARCHAR(100),
                                                  Semail NVARCHAR(100),
                                                         student_status NVARCHAR(50),
                                                                        Slevel char, DID INT, CONSTRAINT Stud_pk PRIMARY KEY (Stud_ID),
                               FOREIGN KEY (DID) REFERENCES HumanResources.Department(DID));


INSERT INTO [Students].[Student] ([Stud_ID], [Sname], [Semail], [student_status], [Slevel], [DID])
SELECT DISTINCT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id],
                [student_name],
                [student_email],
                [student_status],
                [studentGrade],
                [HumanResources].[Department].[DID]
FROM [UniversityDB].[STG].[Data]
JOIN [UniversityDB].[HumanResources].[Department] ON [UniversityDB].[HumanResources].[Department].[Dname] = [UniversityDB].[STG].[Data].Department;

GO


CREATE TABLE HumanResources.Instructor (InsID INT PRIMARY KEY,
                                                  Ins_name NVARCHAR(100),
                                                           Ins_degree NVARCHAR(100),
                                                                      Ins_Phone NVARCHAR(100),
                                                                                Ins_email NVARCHAR(100),
                                                                                          DID INT,
                                        FOREIGN KEY (DID) REFERENCES HumanResources.Department(DID));

GO


CREATE TABLE Courses.Specialization (SPID INT PRIMARY KEY IDENTITY(1, 1),
                                                          SP_name NVARCHAR(100),
                                                                  DID INT,
                                     FOREIGN KEY (DID) REFERENCES HumanResources.Department(DID));

GO


CREATE TABLE Courses.Course (CID INT PRIMARY KEY,
                                     Cname NVARCHAR(100),
                                           score_written FLOAT, with_written BIT, Bubble_sheet NVARCHAR(10),
                                                                                               InsID INT, SPID INT,
                             FOREIGN KEY (InsID) REFERENCES HumanResources.Instructor(InsID),
                             FOREIGN KEY (SPID) REFERENCES Courses.Specialization(SPID));

GO


CREATE TABLE Feedback.CategoryFeedback (CF_ID INT PRIMARY KEY,
                                                  CF_name NVARCHAR(100));

GO


CREATE TABLE Feedback.Feedback (F_ID INT IDENTITY(1, 1),
                                         SID INT , CF_ID INT, Pros NVARCHAR(MAX),
                                                                   Cons NVARCHAR(MAX),
                                                                        Suggestions NVARCHAR(MAX),
                                                                                    is_open_answered BIT, PRIMARY KEY (SID,
                                                                                                                       F_ID),
                                FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                FOREIGN KEY (CF_ID) REFERENCES Feedback.CategoryFeedback(CF_ID));

GO


CREATE TABLE StudentInteraction.FeedbackCourse (SID INT, CID INT, F_ID INT, W1 INT, W2 INT, W3 INT, W4 INT, W5 INT, W6 INT, W7 INT, W8 INT, W9 INT, W10 INT, W11 INT, is_w BIT, PRIMARY KEY (SID,
                                                                                                                                                                                             CID,
                                                                                                                                                                                             F_ID),
                                                FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                                FOREIGN KEY (CID) REFERENCES Courses.Course(CID),
                                                FOREIGN KEY (SID,
                                                             F_ID) REFERENCES Feedback.Feedback(SID, F_ID));


CREATE TABLE StudentInteraction.FeedbackInstructor (SID INT, Ins_ID INT, F_ID INT, X1 INT, X2 INT, X3 INT, X4 INT, X5 INT, X6 INT, X7 INT, X8 INT, X9 INT, X10 INT, X11 INT, X12 INT, X13 INT, X14 INT, is_X BIT, PRIMARY KEY (SID,
                                                                                                                                                                                                                               Ins_ID,
                                                                                                                                                                                                                               F_ID),
                                                    FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                                    FOREIGN KEY (Ins_ID) REFERENCES HumanResources.Instructor(InsID),
                                                    FOREIGN KEY (SID,
                                                                 F_ID) REFERENCES Feedback.Feedback(SID, F_ID));

GO


CREATE TABLE StudentInteraction.FeedbackEvaluation (SID INT, Ins_ID INT, F_ID INT, Y1 INT, Y2 INT, Y3 INT, Y4 INT, Y5 INT, Y6 INT, is_Y BIT, PRIMARY KEY (SID,
                                                                                                                                                          Ins_ID,
                                                                                                                                                          F_ID),
                                                    FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                                    FOREIGN KEY (Ins_ID) REFERENCES HumanResources.Instructor(InsID),
                                                    FOREIGN KEY (SID,
                                                                 F_ID) REFERENCES Feedback.Feedback(SID, F_ID));

GO


CREATE TABLE StudentInteraction.FeedbackExam (SID INT, Ins_ID INT, F_ID INT, Z1 INT, Z2 INT, Z3 INT, Z4 INT, Z5 INT, Z6 INT, Z7 INT, Z8 INT, is_Z BIT, PRIMARY KEY (SID,
                                                                                                                                                                    Ins_ID,
                                                                                                                                                                    F_ID),
                                              FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                              FOREIGN KEY (Ins_ID) REFERENCES HumanResources.Instructor(InsID),
                                              FOREIGN KEY (SID,
                                                           F_ID) REFERENCES Feedback.Feedback(SID, F_ID));

GO


CREATE TABLE StudentInteraction.Grade (SID INT, CID INT, Gradescore_persent FLOAT, PRIMARY KEY (SID,
                                                                                                CID),
                                       FOREIGN KEY (SID) REFERENCES Students.Student(SID),
                                       FOREIGN KEY (CID) REFERENCES Courses.Course(CID));