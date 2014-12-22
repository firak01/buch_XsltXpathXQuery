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
        <h1>Geschäftskunden</h1>
        <ul>
          <xsl:if test="Kundenliste/Kunde/@Typ='g'">
            <xsl:apply-templates select="Kundenliste/Kunde" mode="g"/>
          </xsl:if>
        </ul>
        <h1>Privatkunden</h1>
        <ul>
          <xsl:if test="Kundenliste/Kunde/@Typ='p'">
            <xsl:apply-templates select="Kundenliste/Kunde" mode="p"/>
          </xsl:if>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Kunde (g) -->
  <xsl:template match="Kunde" mode="g">
    <li>
      <xsl:value-of select="Name/Firma"/>
      <xsl:text> | </xsl:text>
      <xsl:value-of select="Name/Branche"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Kunde (p) -->
  <xsl:template match="Kunde" mode="p">
    <xsl:value-of select="Name/Vorname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Name/Nachname"/>
  </xsl:template>
</xsl:stylesheet>
