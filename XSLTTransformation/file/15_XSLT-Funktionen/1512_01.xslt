<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [
  <!-- Entitäten Textbausteine -->
  <!ENTITY de_Anrede "Sehr geehrte">
  <!-- Entitäten Übersetzungen -->
  <!ENTITY de_Herr "&de_Anrede;r Herr ">
  <!ENTITY de_Frau "&de_Anrede; Frau ">
]>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Rechnungen">
    <xsl:for-each select="//Name">
      <xsl:choose>
        <xsl:when test="@Anrede = 'Herr'">&de_Herr;<xsl:value-of select="(Vorname, Nachname)"/>&#xD;</xsl:when>
        <xsl:when test="@Anrede='Frau'">&de_Frau;<xsl:value-of select="(Vorname, Nachname)"/>&#xD;</xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="(Vorname, Nachname)"/>&#xD;</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
