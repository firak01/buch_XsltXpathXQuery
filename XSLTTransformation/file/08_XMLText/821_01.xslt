<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:include href="textausrichtung.xslt"/>
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1"/>
  <!-- Startvorlage -->
  <xsl:template match="//xs:element[parent::xs:schema]">
    <xsl:text>DROP TABLE "</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>";&#xD;</xsl:text>
    <xsl:text>CREATE TABLE "</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>" (&#xD;</xsl:text>
    <xsl:variable name="aktuellesElement" select="@name"/>
<xsl:message><xsl:value-of select="$aktuellesElement"/></xsl:message>
    <xsl:for-each select="//xs:element[ancestor::xs:element/@name=$aktuellesElement]">
      <xsl:call-template name="Einzug">
        <xsl:with-param name="grenze" select="5"/>
      </xsl:call-template>
      <xsl:text>"</xsl:text>
      <xsl:value-of select="@name"/>
      <xsl:text>"</xsl:text>
      <xsl:apply-templates select="@type | xs:simpleType/xs:restriction/@base"/>
      <xsl:apply-templates select="descendant::xs:maxLength/@value"/>
      <xsl:choose>
        <xsl:when test="position()=last()">
          <xs:text>&#xD;);&#xD;</xs:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>,&#xD;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <!-- Datentyperkennung -->
  <xsl:template match="@type | xs:simpleType/xs:restriction/@base">
    <xsl:call-template name="Datentyp">
      <xsl:with-param name="xsWert" select="."/>
    </xsl:call-template>
  </xsl:template>
  <!-- Längenbeschränkung -->
  <xsl:template match="xs:maxLength/@value">
    <xsl:text>(</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  <!-- Vorlage Datentypzuordnung -->
  <xsl:template name="Datentyp">
    <xsl:param name="xsWert"/>
    <xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="$xsWert = 'xs:decimal'">
        <xsl:text>NUMBER</xsl:text>
      </xsl:when>
      <xsl:when test="$xsWert = 'xs:string'">
        <xsl:text>VARCHAR2</xsl:text>
      </xsl:when>
      <xsl:when test="$xsWert = 'xs:dateTime'">
        <xsl:text>DATE</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
