<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:template match="/Kundenliste">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <xsl:apply-templates select="Kunde" />
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Kunde">
    <p>
      <xsl:value-of select="@Anrede" />
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="Name" />
      <br />
      <xsl:apply-templates select="Adresse" />
    </p>
  </xsl:template>
  <xsl:template match="Name">
    <xsl:value-of select="Rufname" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="Zuname" />
  </xsl:template>
  <xsl:template match="Adresse">
    <xsl:value-of select="Strasse" />
    <xsl:text> in </xsl:text>
    <xsl:value-of select="PLZ" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="Stadt" />
  </xsl:template>
</xsl:stylesheet>
