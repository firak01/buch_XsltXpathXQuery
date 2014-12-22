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
        <xsl:apply-templates select="Kundenliste/Kunde"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Element Kunde -->
  <xsl:template match="Kunde">
    <p>
      <b>
        <xsl:value-of select="@Anrede"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="Name"/>
      </b>
      <br/>
      <xsl:apply-templates select="Adresse"/>
    </p>
  </xsl:template>
  <!-- Einbindung -->
  <xsl:include href="911_02.xslt"/>
  <!-- Vorlage für Element Name -->
  <xsl:template match="Name">
    <xsl:value-of select="Rufname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Zuname"/>
  </xsl:template>
  <!-- Vorlage für Element Adresse -->
  <xsl:template match="Adresse">
    <xsl:value-of select="Strasse"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="PLZ"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Stadt"/>
  </xsl:template>
</xsl:stylesheet>
