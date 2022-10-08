USE AdventureWorks2019
GO

IF OBJECT_ID (N'HumanResources.ufn_UserFunction') IS NOT NULL
   DROP FUNCTION HumanResources.ufn_UserFunction
GO

CREATE FUNCTION HumanResources.ufn_UserFunction()
RETURNS TABLE
AS RETURN
(
	SELECT e.LoginID AS Login, e.JobTitle, e.BirthDate, e.HireDate, DATEPART(YEAR, GETDATE())-DATEPART(YEAR, e.BirthDate) AS Edad
	FROM HumanResources.Employee e
)
GO

SELECT *
FROM HumanResources.ufn_UserFunction()

