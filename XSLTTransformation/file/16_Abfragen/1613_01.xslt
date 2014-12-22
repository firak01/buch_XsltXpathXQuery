<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Mehrstufige Gleichheit</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Gleicher Knoten</th>
            <th>Verschiedene Knoten</th>
            <th>Variable und Knoten</th>
            <th>Kinder</th>
          </tr>
          <tr>
            <td>
              <xsl:value-of select="deep-equal(//Rechnung[1], //Rechnung[1])"/>
            </td>
            <td>
              <!--xsl:value-of select="deep-equal(//Rechnung[1], //Rechnung[2])"/-->
            </td>
            <td>
              <xsl:variable name="knoten" select="//Rechnung[1]"/>
              <xsl:value-of select="deep-equal($knoten, //Rechnung[1])"/>
            </td>
            <td>
              <xsl:value-of select="deep-equal(//Rechnungsliste/*, //Rechnungsliste/*)"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
