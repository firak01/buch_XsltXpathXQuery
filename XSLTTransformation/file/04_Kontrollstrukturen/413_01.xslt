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
        <h1>Kundenliste</h1>
        <ul>
          <!-- Start des Ping-Pong-Spiels -->
          <xsl:apply-templates select="Kundenliste/Kunde"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!--  Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <xsl:choose>
      <xsl:when test="@Typ='g'">
        <xsl:call-template name="GKunde"/>
      </xsl:when>
      <xsl:when test="@Typ='p'">
        <xsl:call-template name="PKunde"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- Vorlage für Geschäftskunden -->
  <xsl:template name="GKunde">
    <li>
      <xsl:text>(g) </xsl:text>
      <xsl:value-of select="Name/Firma"/>
      <xsl:text> | </xsl:text>
      <xsl:value-of select="Name/Branche"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Privatkunden -->
  <xsl:template name="PKunde">
    <li>
      <xsl:text>(p) </xsl:text>
      <xsl:value-of select="Name/Vorname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Name/Nachname"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
