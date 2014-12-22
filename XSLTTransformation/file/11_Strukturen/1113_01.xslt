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
        <xsl:choose>
          <xsl:when test="count(child::*) &gt; 0">
            <xsl:apply-templates select="child::*"/>
          </xsl:when>
          <xsl:otherwise>
            <ul>
              <xsl:apply-templates select="child::*"/>
            </ul>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Kinder -->
  <xsl:template match="child::*">
    <xsl:choose>
      <!-- 1. Fall: Kinder vorhanden -->
      <xsl:when test="count(child::*) &gt; 0">
        <!-- Zuordnung der Titel -->
        <xsl:choose>
          <xsl:when test="count(ancestor::*) = 0">
            <h1>
              <xsl:call-template name="Titel"/>
            </h1>
          </xsl:when>
          <xsl:when test="count(ancestor::*) = 1">
            <h2>
              <xsl:call-template name="Titel"/>
            </h2>
          </xsl:when>
          <xsl:when test="count(ancestor::*) = 2">
            <h3>
              <xsl:call-template name="Titel"/>
            </h3>
          </xsl:when>
          <xsl:when test="count(ancestor::*) = 3">
            <h4>
              <xsl:call-template name="Titel"/>
            </h4>
          </xsl:when>
          <xsl:when test="count(ancestor::*) &gt; 3">
            <h5>
              <xsl:call-template name="Titel"/>
            </h5>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <!-- 2. Fall: Keine Kinder vorhanden -->
      <xsl:otherwise>
        <li>
          <xsl:value-of select="(local-name(.), ': ', .)"/>
        </li>
      </xsl:otherwise>
    </xsl:choose>
    <!-- Weiterverarbeitung der Knoten -->
    <xsl:apply-templates select="child::*"/>
  </xsl:template>
  <!-- Vorlage für Titel -->
  <xsl:template name="Titel">
    <xsl:value-of select="local-name(.)"/>
    <xsl:apply-templates select="attribute::*"/>
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
