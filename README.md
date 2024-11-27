# Student_FeedBack
Abstract
This project outlines a comprehensive approach to analyzing and improving student feedback through advanced data management and machine learning techniques.

SQL database designed and populated with student feedback data.
Data warehouse implemented for in-depth analysis across courses, instructors, and feedback categories.
Python scripts for data preprocessing and sentiment analysis.
MLOps techniques to deploy models via a dashboard, enabling real-time monitoring and feedback improvement.
Outcomes showcase data-driven insights to enhance the student learning experience by targeting areas for improvement in teaching and course content.

Introduction
Continuous improvement based on student feedback is essential in education. This project:

Builds a structured SQL database.
Implements a data warehouse for advanced analysis.
Uses Python for sentiment analysis (positive, neutral, negative).
Deploys sentiment analysis models with MLOps for real-time insights.
Project Phases
1. SQL Database Setup and Data Collection
Data Source: Faculty of Education, Ain Shams University.

Columns: Student_id, subject_title, subject_grade
Records: 96,046
Steps:

Clean and structure student data.
Import data using SQL Server tools.
Ensure data integrity (no duplicates, consistent formats).
Database Design:

Tables:
Program
Student
Instructor
Department
Subject
Feedback Questions
2. Data Warehouse and Python Data Processing
Fact Table: Feedback

Dimension Tables: Student, Courses, Instructor, Feedback Questions

Steps:

Extract, transform, and load (ETL) feedback data into the warehouse.
Clean data using Python (removing duplicates, handling missing values, text normalization).
Text Preprocessing with Python:

Tokenization
Stopword removal
Stemming/Lemmatization
3. Sentiment Analysis
Naïve Bayes Model:
Preprocess feedback text.
Categorize as positive, neutral, or negative using NLTK tools.
4. MLOps and Deployment
Create a simple web page for sentiment prediction using Flask in VS Code.
Example Queries
Extract all courses a student is enrolled in:
sql
Copy code
SELECT Courses.CourseName  
FROM students  
JOIN Courses ON students.CourseCode = Courses.CourseCode  
WHERE StudentID = 1001;  
Summarize student grades by course:
sql
Copy code
SELECT S_ID, AVG(Courses.score_Grade) AS AverageGrade  
FROM Courses.Student_course  
GROUP BY CID;  
Find top-performing students:
sql
Copy code
SELECT S_ID, AVG(Courses.score_Grade) AS AverageGrade  
FROM Courses.Student_course  
GROUP BY S_ID  
ORDER BY AverageGrade DESC;  
Technologies Used
SQL Server
Python
Flask
NLTK
Azure Data Services
Contact
For more information, reach out to the supervising team or collaborators.
