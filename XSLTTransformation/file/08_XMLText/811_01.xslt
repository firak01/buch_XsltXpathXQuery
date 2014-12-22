<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:element name="nds">
      <xsl:attribute name="xsi:noNamespaceSchemaLocation"><xsl:text>811_01.xsd</xsl:text></xsl:attribute>
      <xsl:apply-templates select="nds/@*"/>
      <xsl:element name="input">
        <xsl:element name="add">
          <xsl:apply-templates select="nds/input/add/@*"/>
          <xsl:for-each select="nds/input/add">
            <xsl:copy-of select="child::*[@attr-name='Given 
                 Name' or @attr-name='Surname' or 
                @attr-name='Country'
                or @attr-name='Location']"/>
          </xsl:for-each>
          <xsl:element name="add-attr">
            <xsl:attribute name="attr-name"><xsl:text>Telephone Number</xsl:text></xsl:attribute>
            <xsl:element name="value">
              <xsl:attribute name="type"><xsl:text>string</xsl:text></xsl:attribute>
              <xsl:call-template name="ErzeugeTelNr"/>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>
  <!-- Kopiert Attribute und ihre Werte -->
  <xsl:template match="@*">
    <xsl:attribute name="{local-name(.)}"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
  <!-- Setzt aus XML-Rohdaten eine Telnr zusammen -->
  <xsl:template name="ErzeugeTelNr">
    <xsl:if test="/nds/input/add/add-attr[@attr-name='Country']/value = 'DE'">
      <xsl:text>+49 </xsl:text>
    </xsl:if>
    <xsl:if test="/nds/input/add/add-attr[@attr-name='Location']/value = 'Essen'">
      <xsl:text>201 </xsl:text>
    </xsl:if>
    <xsl:value-of select="/nds/input/add/add-attr[@attr-name='Stammnummer']/value"/>
    <xsl:value-of select="/nds/input/add/add-attr[@attr-name='Nebenstellennummer']/value"/>
  </xsl:template>
</xsl:stylesheet>
