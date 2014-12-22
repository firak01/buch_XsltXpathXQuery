<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <xsl:for-each-group select="//Posten" group-by="substring(Tarif,1,1)">
      <xsl:sort select="current-grouping-key()"/>
      <xsl:value-of select="('&#xD;[', current-grouping-key(), ']&#xD;')"/>
      <xsl:for-each select="current-group()">
        <xsl:choose>
          <xsl:when test="starts-with(Tarif, 'Mondschein') and not(ends-with(Tarif, '2'))">
            <xsl:value-of select="('- (', @RefNr, ')', substring-before(Tarif, '1'), ': ', sum(ancestor::Postenliste/Posten[contains(Tarif, 'Mondschein')]/Einzeln), '&#xD;')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="('- (', @RefNr, ')', Tarif, ': ', Einzeln, '&#xD;')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>
</xsl:stylesheet>
