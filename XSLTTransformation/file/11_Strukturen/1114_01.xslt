<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="local-name(/*)"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="child::*"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Kinder -->
  <xsl:template match="child::*">
    <xsl:choose>
      <xsl:when test="count(child::*) &gt; 0">
        <xsl:value-of select="('&lt;h',if (count(ancestor::*)+1 &gt; 6) then (6) else (count(ancestor::*)+1),  '&gt;')" disable-output-escaping="yes"/>
        <xsl:value-of select="local-name(.)"/>
        <xsl:apply-templates select="attribute::*"/>
        <xsl:value-of select="('&lt;/h',if (count(ancestor::*)+1 &gt; 6) then (6) else (count(ancestor::*)+1),  '&gt;')" disable-output-escaping="yes"/>
        <ul>
          <xsl:apply-templates select="child::*"/>
        </ul>
      </xsl:when>
      <xsl:otherwise>
        <li>
          <xsl:value-of select="(local-name(.), ': ', .)"/>
        </li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Vorlage für Attribute -->
  <xsl:template match="attribute::*">
    <xsl:choose>
      <!-- 1. Fall: Position 1 -->
      <xsl:when test="position()=1">
        <xsl:text> (</xsl:text>
      </xsl:when>
      <!-- 2. Fall: Position > 1 und nicht letzte -->
      <xsl:when test="position() &gt; 1 and not(position()=last())">
        <xsl:text>, </xsl:text>
      </xsl:when>
      <!-- 3. Fall: Attribut nicht alleine-->
      <xsl:when test="position()=last() and not(position() = 1)">
        <xsl:text> und </xsl:text>
      </xsl:when>
    </xsl:choose>
    <!-- Wertausgabe -->
    <xsl:value-of select="(local-name(.), .)" separator=": "/>
    <!-- Schlussausgabe -->
    <xsl:if test="position()=last()">
      <xsl:text>)</xsl:text>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
