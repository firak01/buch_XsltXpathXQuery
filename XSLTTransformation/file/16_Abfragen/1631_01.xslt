<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Umsatzliste">
    <xsl:variable name="RL1" select="Rechnung[@R_Nr=9]"/>
    <xsl:variable name="RL2" select="Rechnung[@R_Nr=113]"/>
    <xsl:variable name="RL3" select="Rechnung[@R_Nr=114]"/>
    <html>
      <head>
        <title>Mengenoperationen</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Vereinigung</th>
            <th>Differenz</th>
            <th>Durchschnitt</th>
          </tr>
          <tr>
            <td>
              <xsl:value-of select="($RL1/Posten/@T_Nr union $RL2/Posten/@T_Nr )" separator=" | "/>
            </td>
            <td>
              <xsl:value-of select="($RL1/Posten/@T_Nr except $RL3/Posten/@T_Nr )" separator=" | "/>
            </td> 
            <td>
              <xsl:value-of select="($RL1/Posten/@T_Nr intersect $RL3/Posten/@T_Nr )" separator=" | "/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
