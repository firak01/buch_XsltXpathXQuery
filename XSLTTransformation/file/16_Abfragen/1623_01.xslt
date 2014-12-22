<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <Tarifliste>
      <!-- Werteliste -->
      <xsl:variable name="tarif-liste">
        <xsl:for-each select="//Tarif">
          <Tarif>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="anzahl"><xsl:value-of select="count(//Tarif[@T_Name = current()/@T_Name])"/></xsl:attribute>
          </Tarif>
        </xsl:for-each>
      </xsl:variable>
      <!-- Ausgabe -->
      <xsl:for-each select="$tarif-liste[Tarif/@anzahl &gt; 1]">
        <xsl:copy-of select="current()"/>
      </xsl:for-each>
      
    </Tarifliste>
  </xsl:template>
</xsl:stylesheet>
