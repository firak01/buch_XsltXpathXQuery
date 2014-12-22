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
        <!-- Vorlagenaufruf für wiederholende Elemente -->
        <xsl:apply-templates select="Kundenliste/Kunde"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Element Kunde -->
  <xsl:template match="Kunde">
    <p>
      <xsl:value-of select="@Anrede"/>
      <xsl:text> </xsl:text>
      <!-- Verarbeitung von Name -->
      <xsl:value-of select="Name/Rufname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Name/Zuname"/>
      <br/>
      <!-- Verarbeitung von Adresse -->
      <xsl:value-of select="Adresse/Strasse"/>
      <xsl:text> in </xsl:text>
      <xsl:value-of select="Adresse/PLZ"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Adresse/Stadt"/>
    </p>
  </xsl:template>
</xsl:stylesheet>
