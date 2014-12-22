<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Erfolgübersicht</title>
      </head>
      <body>
        <ul>
          <xsl:for-each select="//Erfolg">
            <li>
              <xsl:value-of select="(@Stadt, Gesamt, Neukunden)" separator=" | "/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
