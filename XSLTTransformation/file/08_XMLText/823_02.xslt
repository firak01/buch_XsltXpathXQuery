<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="textausrichtung.xslt"/>
  <xsl:output method="text" encoding="ISO-8859-1"/>
  <xsl:strip-space elements="*"/>
  <!-- Vorlage für Postenliste -->
  <xsl:template match="/">
    <xsl:text> Pos.    Name             Preis&#xD;|-------+----------------+--------|&#xD;</xsl:text>
    <xsl:for-each select="Rechnung/Details/Posten">
      <!-- Pos. -->
      <xsl:text>| </xsl:text>
      <xsl:number count="Posten" level="single" format="1.)"/>
      <xsl:call-template name="Einzug">
        <xsl:with-param name="Grenze" select="2"/>
      </xsl:call-template>
      <!-- Name -->
      <xsl:text>| </xsl:text>
      <xsl:value-of select="Tarif"/>
      <xsl:call-template name="Einzug">
        <xsl:with-param name="Grenze" select="14-string-length(Tarif)"/>
      </xsl:call-template>
      <!-- Preis -->
      <xsl:text>| </xsl:text>
      <xsl:value-of select="Einzeln"/>
      <xsl:call-template name="Einzug">
        <xsl:with-param name="Grenze" select="6-string-length(Einzeln)"/>
      </xsl:call-template>
      <xsl:text>|&#xD;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
