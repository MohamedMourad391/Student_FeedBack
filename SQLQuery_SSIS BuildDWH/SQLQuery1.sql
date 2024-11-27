SELECT
   SF.S_ID,
  
  SF.CID,
	
fq.QuestionID,

HI.InsId,
    CASE WHEN SF.QuestionID BETWEEN 100 AND 110 THEN sf.Response END AS course_evaluation,
    CASE WHEN SF.QuestionID BETWEEN 200 AND 213 THEN sf.Response END AS instructor_evaluation,
    CASE WHEN SF.QuestionID BETWEEN 300 AND 305 THEN sf.Response END AS exam_evaluation,
    CASE WHEN SF.QuestionID BETWEEN 400 AND 407 THEN sf.Response END AS course_page_evaluation,
    CASE WHEN SF.QuestionID BETWEEN 500 AND 502 THEN sf.Response END AS open_questions

 FROM Feedback.Student_Feedback SF join 
Feedback.Feedback_Questions fq  
on fq.QuestionID=SF.QuestionID

join Cources.cource CC on CC.CID=SF.CID 

join HumanResources.Instructor HI on HI.InsID=CC.InsId

GROUP BY SF.S_ID, SF.CID ,fq.QuestionID , HI.InsID