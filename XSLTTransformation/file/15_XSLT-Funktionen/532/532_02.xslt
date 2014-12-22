<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Attributgruppe für mehrfach auftretendes R-Attribut -->
  <xsl:attribute-set name="R-Attribut">
    <xsl:attribute name="R"><xsl:value-of select="ancestor::Rechnung/@Nr"/></xsl:attribute>
  </xsl:attribute-set>
  <!-- Verarbeitung -->
  <xsl:template match="/">
    <Umsatz>
      <!-- Jedes Produkt ... -->
      <xsl:for-each select="//Posten/Tarif">
        <Tarifliste xsl:use-attribute-sets="R-Attribut">
          <xsl:attribute name="T"><xsl:value-of select="."/></xsl:attribute>
          <xsl:variable name="tarif1" select="."/>
          <!-- ... mit jedem Produkt vergleichen ... -->
          <xsl:for-each select="//Posten/Tarif">
            <xsl:variable name="tarif2" select="."/>
            <!-- ... aber nicht gleiche Produkte miteinander -->
            <xsl:if test="generate-id($tarif1) != generate-id($tarif2)">
              <Tarif xsl:use-attribute-sets="R-Attribut">
                <xsl:value-of select="$tarif2"/>
              </Tarif>
            </xsl:if>
          </xsl:for-each>
        </Tarifliste>
      </xsl:for-each>
    </Umsatz>
  </xsl:template>
</xsl:stylesheet>
