<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Zeiten</title>
      </head>
      <body>
        <ul>
          <li>Aktuelles Datum: <xsl:value-of select="format-date(current-date(), '[M].[D].[Y]')"/>
          </li>
          <li>Aktuelle Zeit: <xsl:value-of select="format-time(current-time(), '[H]:[m]:[s]')"/>
          </li>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
