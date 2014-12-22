<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Umsatz-Pro-Stadt">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <xsl:variable name="MaxDateTime" select="max(//xs:dateTime(Beginn))"/>
        <xsl:variable name="MinDateTime" select="min(//xs:dateTime(Beginn))"/>
        <xsl:variable name="MaxDate" select="max(//Beginn/xs:date(substring-before(text(), 'T')))"/>
        <xsl:variable name="MinDate" select="min(//Beginn/xs:date(substring-before(text(), 'T')))"/>
        <h2>Basis xs:dateTime</h2>
        <ul>
          <li>
            <xsl:value-of select="('Differenz Tage: ' , subtract-dateTimes-yielding-dayTimeDuration($MaxDateTime, $MinDateTime))"/>
          </li>
          <li>
            <xsl:value-of select="('Differenz Monate: ' , subtract-dateTimes-yielding-yearMonthDuration($MaxDateTime, $MinDateTime))"/>
          </li>
        </ul>
        <h2>Basis xs:date</h2>
        <ul>
          <li>
            <xsl:value-of select="('Differenz Tage: ' , subtract-dates-yielding-dayTimeDuration($MaxDate, $MinDate))"/>
          </li>
          <li>
            <xsl:value-of select="('Differenz Monate: ' , subtract-dates-yielding-yearMonthDuration($MaxDate, $MinDate))"/>
          </li>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
