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
        <xsl:for-each-group select="Umsatz" group-by="year-from-dateTime(Beginn)">
          <h1>
            <xsl:value-of select="('Jahr', year-from-dateTime(Beginn))" separator=" "/>
          </h1>
          <xsl:for-each-group select="current-group()" group-by="month-from-dateTime(Beginn)">
            <h2>
              <xsl:value-of select="('Monat ', month-from-dateTime(Beginn))"/>
            </h2>
            <xsl:for-each-group select="current-group()" group-by="day-from-dateTime(Beginn)">
              <h3>
                <xsl:value-of select="('Tag ', day-from-dateTime(Beginn))"/>
              </h3>
              <table border="1" bgcolor="wheat">
                <tr>
                  <xsl:for-each-group select="current-group()" group-by="hours-from-dateTime(Beginn)">
                    <td>
                      <b>
                        <xsl:value-of select="('Stunde ', hours-from-dateTime(Beginn))"/>
                      </b>
                      <br/>
                      <ul>
                        <li>
                          <xsl:value-of select="('Dauer: ', sum(Dauer))"/>
                        </li>
                        <li>
                          <xsl:value-of select="('Cent: ', sum(Umsatz))"/>
                        </li>
                      </ul>
                    </td>
                  </xsl:for-each-group>
                </tr>
              </table>
            </xsl:for-each-group>
          </xsl:for-each-group>
        </xsl:for-each-group>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>