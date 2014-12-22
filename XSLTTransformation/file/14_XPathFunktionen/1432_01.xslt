<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Rechnungen">
    <Umsatz>
      <xsl:choose>
        <xsl:when test="exists(//Tarif)">
          <Verwendete-Tarife>
            <xsl:for-each select="distinct-values(//Tarif)">
              <Tarif>
                <xsl:variable name="Tarif" select="."/>
                <xsl:variable name="Indizes" select="index-of(//Tarif, $Tarif)"/>
                <Name>
                  <xsl:value-of select="$Tarif"/>
                </Name>
                <xsl:if test="not(empty($Indizes))">
                  <Fundstellen>
                    <xsl:attribute name="Zahl"><xsl:value-of select="count($Indizes)"/></xsl:attribute>
                    <xsl:for-each select="$Indizes">
                      <Fundstelle>
                        <xsl:value-of select="."/>
                      </Fundstelle>
                    </xsl:for-each>
                  </Fundstellen>
                </xsl:if>
              </Tarif>
            </xsl:for-each>
          </Verwendete-Tarife>
        </xsl:when>
      </xsl:choose>
    </Umsatz>
  </xsl:template>
</xsl:stylesheet>
