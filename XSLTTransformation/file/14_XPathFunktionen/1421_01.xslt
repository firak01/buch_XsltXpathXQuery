<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <xsl:for-each select="//Kunde">
      <xsl:apply-templates select="Name | Adresse"/>
    </xsl:for-each>
  </xsl:template>
  <!-- Vorlage für Name -->
  <xsl:template match="Name">
    <xsl:variable name="Name" select="string-join((normalize-space(Vorname), normalize-space(Nachname)), ' ')"/>
    <xsl:value-of select="upper-case($Name)"/>
    <xsl:text>&#xD;</xsl:text>
    <xsl:value-of select="for $i in string-to-codepoints($Name) return '-'"/>
    <xsl:text>-&#xD;</xsl:text>
  </xsl:template>
  <!-- Vorlage für Adresse -->
  <xsl:template match="Adresse">
    <xsl:value-of select="(Strasse, concat(PLZ, ' ', Stadt))" separator="&#xD;"/>
    <xsl:text>&#xD;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
