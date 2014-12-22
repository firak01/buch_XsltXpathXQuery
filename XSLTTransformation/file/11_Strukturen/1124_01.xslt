<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="local-name(/*)"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für einheit -->
  <xsl:template match="einheit">
    <xsl:apply-templates select="@name"/>
    <xsl:apply-templates/>
  </xsl:template>
  <!-- Vorlage für sammlung -->
  <xsl:template match="sammlung">
    
      <xsl:apply-templates select="@name"/>
      <ul>
        <xsl:apply-templates/>
      </ul>
    
  </xsl:template>
  <!-- Vorlage für wert mit Textknoten -->
  <xsl:template match="wert[exists(text())]">
    <li>
      <xsl:value-of select="(@name, ': ')"/>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <!-- Vorlage für wert ohne Textknoten -->
  <xsl:template match="wert[not(exists(text()))]">
    <xsl:apply-templates select="@name"/>
    <ol>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>
  <!-- Vorlage für text() -->
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
  <!-- Vorlage für @name) -->
  <xsl:template match="@name">
    <li>
      <xsl:value-of select="."/>
    </li>
    
  </xsl:template>
</xsl:stylesheet>
