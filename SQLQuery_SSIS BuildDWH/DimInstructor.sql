SELECT I.InsID,I.Ins_name,I.Ins_email,I.Ins_Phone,I.Degree,D.Dname
FROM HumanResources.Instructor I, HumanResources.Department D
WHERE D.DID=I.DID 