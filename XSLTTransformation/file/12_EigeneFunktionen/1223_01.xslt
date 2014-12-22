<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
  <!-- Vorlage für Datentyp xs:time -->
  <xsl:template match="child::*[@Typ='xs:time']">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="substring-before(., ':')"/> Uhr</li>
  </xsl:template>
  <!-- Vorlage für Datentyp xs:date -->
  <xsl:template match="child::*[@Typ='xs:date']">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="concat(substring(.,9,2),'.',substring(.,6,2),'.',substring(.,1,4))"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Datentyp xs:decimal -->
  <xsl:template match="child::*[@Typ='xs:decimal']">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="format-number(.,'#####,00##', 'deutsch')"/> Euro</li>
  </xsl:template>
  <!-- Vorlage für Datentyp xs:integer -->
  <xsl:template match="child::*[@Typ='xs:integer']">
    <li>
      <xsl:value-of select="local-name(.)"/>: <xsl:value-of select="."/>
    </li>
  </xsl:template>
</xsl:stylesheet>
