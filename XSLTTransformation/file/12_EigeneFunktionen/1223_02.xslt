<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="." name="deutsch"/>
  <!-- Startvorlage -->
  <xsl:template match="/Tarifliste">
    <html>
      <head>
        <title>Tarifliste</title>
      </head>
      <body>
        <xsl:for-each select="Tarif">
          <h1>
            <xsl:value-of select="Name"/>
          </h1>
          <xsl:apply-templates select="Gueltigkeit | Uhrzeit | Umsatz"/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Gueltigkeit | Uhrzeit | Umsatz">
    <ul>
      <xsl:apply-templates select="child::*"/>
    </ul>
  </xsl:template>
  <!-- Vorlage f�r Datentyp xs:time -->
  <xsl:template match="child::*[text() castable as xs:time]">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="substring-before(xs:string(.), ':')"/> Uhr</li>
  </xsl:template>
  <!-- Vorlage f�r Datentyp xs:date -->
  <xsl:template match="child::*[text() castable as xs:date]">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="concat(substring(xs:string(.),9,2),'.',substring(xs:string(.),6,2),'.',substring(xs:string(.),1,4))"/>
    </li>
  </xsl:template>
  <!-- Vorlage f�r Datentyp xs:decimal -->
  <xsl:template match="child::*[text() castable as xs:decimal]">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="format-number(.,'#####,00##', 'deutsch')"/> Euro</li>
  </xsl:template>
  <!-- Vorlage f�r Datentyp xs:integer -->
  <xsl:template match="child::*[text() castable as xs:integer]">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="."/>
    </li>
  </xsl:template>
</xsl:stylesheet>
