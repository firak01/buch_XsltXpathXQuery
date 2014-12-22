<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Tarifliste">
    <Tarifliste>
      <xsl:for-each select="Tarif">
        <Tarif>
          <Name>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Elemente'"/>
              <xsl:with-param name="Material" select="Name/attribute::*"/>
            </xsl:call-template>
          </Name>
          <Gueltigkeit>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Attribute'"/>
              <xsl:with-param name="Material" select="Gueltigkeit/child::*"/>
            </xsl:call-template>
          </Gueltigkeit>
          <Uhrzeit>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Attribute'"/>
              <xsl:with-param name="Material" select="Uhrzeit/child::*"/>
            </xsl:call-template>
          </Uhrzeit>
          <Umsatz>
            <xsl:call-template name="KnotenFabrik">
              <xsl:with-param name="Art" select="'Elemente'"/>
              <xsl:with-param name="Material" select="Umsatz/child::*"/>
            </xsl:call-template>
          </Umsatz>
        </Tarif>
      </xsl:for-each>
    </Tarifliste>
  </xsl:template>
  <!-- Vorlage KnotenFabrik -->
  <xsl:template name="KnotenFabrik">
    <xsl:param name="Art" required="yes" as="xs:string"/>
    <xsl:param name="Material" required="yes"/>
    <xsl:apply-templates select="document('')/*/xsl:template[@name=$Art]">
      <xsl:with-param name="Material" select="$Material"/>
    </xsl:apply-templates>
  </xsl:template>
  <!-- Vorlage Elemente -->
  <xsl:template name="Elemente" match="xsl:template[@name='Elemente']">
    <xsl:param name="Material" required="yes"/>
    <xsl:for-each select="$Material">
      <xsl:element name="{local-name(.)}">
        <xsl:value-of select="."/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  <!-- Vorlage Attribute -->
  <xsl:template name="Attribute" match="xsl:template[@name='Attribute']">
    <xsl:param name="Material" required="yes"/>
    <xsl:for-each select="$Material">
      <xsl:attribute name="{local-name(.)}"><xsl:value-of select="."/></xsl:attribute>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
