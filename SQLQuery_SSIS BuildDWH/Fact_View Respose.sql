select 

SR.S_ID,
SR.CID,	
fq.QuestionID,
HI.InsId,
SR.open_questions,
SR.course_page_evaluation,
SR.exam_evaluation,
SR.instructor_evaluation,
SR.cource_evaluation

FROM Sort_Response SR join 
Feedback.Feedback_Questions fq  
on fq.QuestionID=SR.QuestionID

join Cources.cource CC on CC.CID=SR.CID 

join HumanResources.Instructor HI on CC.InsID=HI.InsId


