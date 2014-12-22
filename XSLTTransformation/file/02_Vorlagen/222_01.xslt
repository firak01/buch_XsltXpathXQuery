<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Anrufliste">
    <html>
      <head>
        <title>Anrufliste</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Anruf"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Grundvorlage für Anruf -->
  <xsl:template match="Anruf">
    <li>
      <xsl:call-template name="AnrufDaten"/>
      <br/>
      <xsl:call-template name="Kunde"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Anruf-Daten -->
  <xsl:template name="AnrufDaten">
    <xsl:text>Nr.: </xsl:text>
    <xsl:value-of select="@Nr"/>
    <xsl:text> | Typ: </xsl:text>
    <xsl:value-of select="@Typ"/>
    <br/>
    <xsl:text>Zeit: </xsl:text>
    <xsl:value-of select="Beginn"/>
    <xsl:text>, Dauer: </xsl:text>
    <xsl:value-of select="Dauer"/>
    <xsl:text> Sek., Kosten: </xsl:text>
    <xsl:value-of select="Preis"/>
    <xsl:text> Cent.</xsl:text>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template name="Kunde">
  <xsl:text>(</xsl:text>
    <xsl:value-of select="Von/@Nr"/>
    <xsl:text>) </xsl:text>
    <xsl:value-of select="Von/Name"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="Von/Stadt"/>
  </xsl:template>
</xsl:stylesheet>
