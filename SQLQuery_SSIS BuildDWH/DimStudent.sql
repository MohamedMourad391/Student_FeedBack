Use UniversityDB
SELECT S.S_ID, S.Sname,S.Semail,S.Slevel,S.SStatus ,P.Department ,P.Specialization
FROM Students.Student S ,Students.Program P
WHERE P.PID =S.PID