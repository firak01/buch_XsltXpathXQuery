<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Umsatz-Pro-Stadt">
    <xsl:variable name="Tarife" select="insert-before(distinct-values(//xs:string(Stadt)), 2, 'Düsseldorf')"/>
    <xsl:for-each select="$Tarife">
      <xsl:choose>
        <!-- Letzter Knoten -->
        <xsl:when test="position() = count($Tarife)">
          <xsl:value-of select="(' und ', .)"/>
        </xsl:when>
        <!-- Einziger Knoten -->
        <xsl:when test="position() = 1 and position() = count($Tarife)">
          <xsl:value-of select="."/>
        </xsl:when>
        <!-- Erster Knoten -->
        <xsl:when test="position() = 1">
          <xsl:value-of select="(., ', ')"/>
        </xsl:when>
        <!-- Vorletzer Knoten -->
        <xsl:when test="position() = count($Tarife) -1">
          <xsl:value-of select="."/>
        </xsl:when>
        <!-- Mittlerer Knoten -->
         <xsl:when test="position() &gt; 1 and position() &lt; count($Tarife) -1">
          <xsl:value-of select="(., ', ')"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
