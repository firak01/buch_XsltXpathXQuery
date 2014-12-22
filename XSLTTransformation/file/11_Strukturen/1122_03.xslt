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
      <!-- Fall 1: Name enthält "Liste" -->
      <xsl:when test="contains(lower-case(local-name()), 'liste')">
        <xsl:variable name="Listen-Vorfahren" select="count(ancestor::*[contains(lower-case(local-name()), 'liste')])"/>
        <!-- Zuordnung von Überschriften anhand der Listenvorfahren -->
        <xsl:choose>
          <xsl:when test="$Listen-Vorfahren = 0">
            <h1>
              <xsl:value-of select="name(.)"/>
            </h1>
            <!-- Verfügbare Namensräume -->
            <ul>
              <xsl:for-each select="namespace::*[not(contains(.,'w3'))]">
                <li>
                  <xsl:value-of select="."/>
                </li>
              </xsl:for-each>
            </ul>
            <!-- Verfügbare Namensraumpräfixe -->
            <ul>
              <xsl:for-each select="in-scope-prefixes(.)[not(contains(.,'x') or string-length(.) = 0)]">
                <li>
                  <xsl:value-of select="."/>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:when>
          <xsl:when test="$Listen-Vorfahren = 1">
            <h2>
              <xsl:value-of select="name(.)"/>
            </h2>
          </xsl:when>
          <xsl:when test="$Listen-Vorfahren &gt; 1">
            <h3>
              <xsl:value-of select="name(.)"/>
            </h3>
          </xsl:when>
        </xsl:choose>
        <ul>
          <xsl:apply-templates select="child::*"/>
        </ul>
      </xsl:when>
      <!-- Fall 2: Elternname enthält "Liste" -->
      <xsl:when test="contains(lower-case(parent::*/local-name()), 'liste')">
        <li>
          <xsl:value-of select="name(.)"/>
          <br/>
          <xsl:apply-templates select="child::*"/>
        </li>
      </xsl:when>
      <!-- Fall 3: Name und Eltern-Name enthalten nicht "Liste" -->
      <xsl:when test="not(contains(lower-case(parent::*/local-name()), 'liste')) and not(contains(lower-case(local-name()), 'liste'))">
        <xsl:value-of select="(name(.), ': ', .)"/>
        <br/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
