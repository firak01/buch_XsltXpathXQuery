-- XML-Variable erstellen
DECLARE @productXML xml, @idoc int
-- XML abrufen
SET @productXML = (
SELECT ProductNumber AS "P-Nr", 
       Name          AS "Name", 
       StandardCost  AS "Prices/Standard",
       ListPrice     AS "Prices/List",
       Size          AS "Details/Size",
       Color         AS "Details/Color"
  FROM Production.Product
 ORDER BY ProductID DESC
FOR XML PATH('Product'), ROOT('Product-List'))
-- Standardzerlegung für alle Zeilen

DECLARE   @Color [varchar](20)
SET @Color='Black'
SELECT @productXML.query('<Product-List> { 
  for $A in /Product-List/Product
    where $A [Details/Color = sql:variable("@Color")]
    return $A}
 </Product-List>') 


