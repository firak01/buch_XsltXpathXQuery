<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Erfolgsübersicht</title>
      </head>
      <body>
        <xsl:for-each select="Quartale/Datei">
          <h1>Quartal <xsl:value-of select="position()"/>
          </h1>
          <ul>
            <xsl:apply-templates select="document(@Name)/Erfolguebersicht"/>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Erfolg-Element -->
  <xsl:template match="Erfolguebersicht/Erfolg">
    <xsl:for-each select=".">
      <xsl:sort data-type="number" order="descending" select="Neukunden"/>
      <li>
        <xsl:value-of select="@Stadt"/>
        <xsl:text> | Monat: </xsl:text>
        <xsl:value-of select="@Monat"/>
        <xsl:text> | Neukunden: </xsl:text>
        <xsl:value-of select="Neukunden"/>
      </li>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
