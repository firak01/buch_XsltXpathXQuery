<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Rechnungen">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <xsl:for-each select="//Rechnung">
          <xsl:apply-templates select="Kunde | Postenliste"/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <h1>
      <xsl:value-of select="(Name/Vorname, Name/Nachname)" separator=" "/>
    </h1>
  </xsl:template>
  <!-- Vorlage für Postenliste -->
  <xsl:template match="Postenliste">
    <xsl:variable name="Anzahl" select="count(Posten)"/>
    <xsl:choose>
      <xsl:when test="$Anzahl = 0">
        <xsl:value-of select="zero-or-one(Posten)/Tarif"/>
      </xsl:when>
      <xsl:when test="$Anzahl &gt; 1">
        <p>
          <xsl:value-of select="one-or-more(Posten)/Tarif" separator=" | "/>
        </p>
      </xsl:when>
      <xsl:when test="$Anzahl = 1">
        <xsl:value-of select="exactly-one(Posten)/Tarif"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>Keine Knoten</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
