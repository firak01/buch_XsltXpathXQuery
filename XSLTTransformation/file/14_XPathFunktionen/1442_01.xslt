<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Umsatz-Pro-Stadt">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <xsl:for-each-group select="Umsatz" group-by="Beginn">
          <xsl:sort select="current-grouping-key()"/>
          <h1>
            <xsl:value-of select="current-grouping-key()"/>
          </h1>
          <table border="1">
            <tr>
              <th>Ursprung</th>
              <th>-5 h</th>
              <th>+10 h</th>
            </tr>
            <xsl:for-each select="current-group()">
              <tr>
                <td>
                  <xsl:value-of select="Beginn"/>
                </td>
                <td>
                  <xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime(Beginn), xdt:dayTimeDuration('PT5H'))"/>
                </td>
                <td>
                  <xsl:value-of select="adjust-dateTime-to-timezone(xs:dateTime(Beginn), xdt:dayTimeDuration('+PT10H0M'))"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:for-each-group>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
