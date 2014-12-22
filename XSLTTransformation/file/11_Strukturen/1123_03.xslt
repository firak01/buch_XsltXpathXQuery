<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Monatsliste" priority="2.0">
    <html>
      <head>
        <title>
          <xsl:value-of select="local-name(/*)"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="Monat"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Monat -->
  <xsl:template match="Monat" priority="2.0">
    <h2>
      <xsl:value-of select="(position(), local-name(.))" separator=".) "/>
    </h2>
    <table border="1">
      <tr>
        <xsl:for-each select="child::*">
          <th>
            <xsl:value-of select="local-name(.)"/>
          </th>
        </xsl:for-each>
      </tr>
      <xsl:apply-templates select="child::*"/>
    </table>
  </xsl:template>
  <!-- Vorlage für Kinder -->
  <xsl:template match="child::*">
    <xsl:choose>
    <!-- Eltern = Monat -->
      <xsl:when test="local-name(parent::*)='Monat'">
        <xsl:choose>
        <!-- Keine Kinder, sondern Textknoten -->
          <xsl:when test="count(child::*) = 0 and exists(text())">
            <td>
              <xsl:value-of select="."/>
            </td>
          </xsl:when>
          <!-- Ein Kind -->
          <xsl:when test="count(child::*) = 1">
            <td>
              <xsl:value-of select="."/>
            </td>
          </xsl:when>
          <!-- Mehr als ein Kind -->
          <xsl:when test="count(child::*) &gt; 1">
            <td>
              <xsl:apply-templates select="child::*"/>
            </td>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <!-- Eltern != Monat -->
      <xsl:when test="not(local-name(parent::*)='Monat')">
        <table border="1">
          <tr>
          <!-- Kinder von Monat -> TH -->
            <xsl:for-each select="child::*">
              <th>
                <xsl:value-of select="local-name(.)"/>
              </th>
            </xsl:for-each>
          </tr>
          <tr>
            <xsl:for-each select="child::*">
              <td>
              <!-- Kinder von Kinder von Monat -> TD -->
                <xsl:for-each select="child::*">
                  <xsl:value-of select="('(', local-name(.),')',.)"/>
                  <br/>
                </xsl:for-each>
              </td>
            </xsl:for-each>
          </tr>
        </table>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
