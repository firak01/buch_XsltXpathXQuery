<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Tarifliste">
    <Tarifliste>
      <xsl:for-each select="Tarif">
        <Tarif>
          <xsl:copy-of select="Name"/>
          <Gueltigkeit>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Elemente'"/>
              
            </xsl:call-template>
          </Gueltigkeit>
          <Uhrzeit>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Attribute'"/>
             
            </xsl:call-template>
          </Uhrzeit>
          <Umsatz>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Attribute'"/>
              
            </xsl:call-template>
          </Umsatz>
        </Tarif>
      </xsl:for-each>
    </Tarifliste>
  </xsl:template>
  <!-- Vorlage KnotenFabrik -->
  <xsl:template name="KnotenFabrik">
    <xsl:param name="Art" required="yes" as="xs:string"/>
    
   
    <xsl:apply-templates select="document('')/*/xsl:template[@name=$Art]"/>
  </xsl:template>
  <!-- Vorlage Elemente -->
<xsl:template name="Elemente" match="xsl:template[@name='Elemente']"><xsl:value-of select="."/>
</xsl:template>
  <!-- Vorlage Attribute -->
  <xsl:template name="Attribute" match="xsl:template[@name='Attribute']">
<xsl:value-of select="."/>
</xsl:template>
</xsl:stylesheet>
