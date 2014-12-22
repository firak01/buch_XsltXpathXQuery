<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/*">
    <Umsatzliste>
      <xsl:apply-templates select="Rechnungsliste/Rechnung"/>
    </Umsatzliste>
  </xsl:template>
  <!-- Vorlage für Rechnung -->
  <xsl:template match="Rechnung">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="//Posten[@R_Nr = current()/@R_Nr]"/>
    </xsl:copy>
  </xsl:template>
  <!-- Vorlage für Posten -->
  <xsl:template match="Posten">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
