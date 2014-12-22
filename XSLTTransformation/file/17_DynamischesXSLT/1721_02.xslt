<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
  <!--Startvorlage-->
  <xsl:template match="/ Erfolguebersicht">
    <html xmlns="">
      <head>
        <title>
          <xsl:value-of select="local-name(/*)" />
        </title>
      </head>
      <body>
        <ul>
          <xsl:for-each select="Erfolg">
            <li>
              <xsl:value-of select="(local-name(Gesamt),': ', Gesamt, ' ')" />
              <xsl:value-of select="(local-name(Neukunden),': ', Neukunden, ' ')" />
              <xsl:value-of select="(local-name(@Stadt),': ', @Stadt, ' ')" />
              <xsl:value-of select="(local-name(@Monat),': ', @Monat, ' ')" />
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
