<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Sortierschlüssel -->
  <xsl:sort-key name="Erfolgsortierung">
    <xsl:sort data-type="text" order="ascending" select="@Stadt"/>
    <xsl:sort data-type="number" order="ascending" select="Neukunden"/>
  </xsl:sort-key>
  <!-- Grundvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundenstatistik</title>
      </head>
      <body>
        <ul>
          <xsl:for-each select="fn:sort(Erfolguebersicht/Erfolg, 'Erfolgsortierung')">
            <li>
              <xsl:value-of select="@Stadt"/>
              <xsl:text> | Monat: </xsl:text>
              <xsl:value-of select="@Monat"/>
              <xsl:text> | Neukunden: </xsl:text>
              <xsl:value-of select="Neukunden"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
