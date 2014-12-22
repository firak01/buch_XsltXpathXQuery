
DECLARE @productXML XML, @productXSLT NVARCHAR(MAX)
-- Füllen der @productXML mit Daten
SET @productXML = ( 
 SELECT Name, ProductNumber, ListPrice
  FROM Production.Product 
   FOR XML PATH('Product'), ROOT('Product-List'))
-- Füllen der @productXSLT mit Daten
SET @productXSLT=
'<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Transform X</title>
      </head>
      <body>
        <ul>
          <xsl:for-each select="//Product">
            <li>
              <xsl:value-of select="Name"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>'

--Aufrufen der Funktion zur Transformation (Umwandlung der Datentypen inbegriffen)
SELECT AdventureWorks.dbo.Transform(CAST(@productXML AS nvarchar(max)),@productXSLT) AS HTML