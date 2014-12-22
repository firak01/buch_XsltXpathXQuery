<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <ol>
      <xsl:for-each select="//Rechnung">
        <li>
          <xsl:apply-templates select="Kunde/Name"/>
          <ul>
            <xsl:apply-templates select="Postenliste/Posten"/>
          </ul>
        </li>
      </xsl:for-each>
    </ol>
  </xsl:template>
  <!-- Vorlage für Name -->
  <xsl:template match="Name">
    <xsl:choose>
      <xsl:when test="lang('de')"><xsl:value-of select="(@Anrede, ' ')"/>
        <xsl:for-each select="child::*">
          <xsl:value-of select="(local-name(.), ': ',  ., ' ')"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="('Mr. ', Vorname, ' ', Nachname)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- Vorlage für Posten -->
  <xsl:template match="Posten">
    <li><xsl:for-each select="child::*"><xsl:value-of select="(local-name(.), ': ',  ., ' ')"/></xsl:for-each></li>
  </xsl:template>
</xsl:stylesheet>
