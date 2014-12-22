--Löschen der Assembly und der Funktion
DROP ASSEMBLY AdventureWorks.dbo.myTransformation
DROP FUNCTION AdventureWorks.dbo.Transform

--Anlegen der Assembly
CREATE ASSEMBLY AdventureWorks.dbo.myTransformation FROM 'C:\Transform.dll'
GO 
--Anlegen der Funkion zum Transformieren
CREATE FUNCTION AdventureWorks.dbo.Transform (
  @InputXML  nvarchar(max),
  @InputXSLT  nvarchar(max) )
RETURNS nvarchar(max)
AS EXTERNAL NAME myTransformation.[Transform.MyTransformingClass].Transform
GO


