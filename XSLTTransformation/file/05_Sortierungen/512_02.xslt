<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Grundvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundenstatistik</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Erfolguebersicht/Erfolg">
            <xsl:sort data-type="number" order="descending" select="Neukunden"/>
          </xsl:apply-templates>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Erfolg -->
  <xsl:template match="Erfolg">
    <li>
      <xsl:value-of select="@Stadt"/>
      <xsl:text> | Monat: </xsl:text>
      <xsl:value-of select="@Monat"/>
      <xsl:text> | Neukunden: </xsl:text>
      <xsl:value-of select="Neukunden"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
