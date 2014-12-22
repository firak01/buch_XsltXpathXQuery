<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Kundenliste/Kunde"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <li>
      <!-- Bereich für Geschäftskunden -->
      <xsl:if test="@Typ='g'">
        <xsl:text>(g) </xsl:text>
        <xsl:value-of select="Name/Firma"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="Name/Branche"/>
      </xsl:if>
      <!-- Bereich für Privatkunden -->
      <xsl:if test="@Typ='p'">
        <xsl:text>(p) </xsl:text>
        <xsl:value-of select="Name/Vorname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Name/Nachname"/>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
