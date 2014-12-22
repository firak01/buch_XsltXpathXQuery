<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Attributmenge -->
  <xsl:attribute-set name="Schluessel">
    <xsl:attribute name="Nr"><xsl:value-of select="@Nr"/></xsl:attribute>
  </xsl:attribute-set>
  <!-- Grundvorlage -->
  <xsl:template match="/">
    <Anrufliste>
      <xsl:attribute name="xsi:noNamespaceSchemaLocation">17_04neu2.xsd</xsl:attribute>
      <xsl:for-each select="Anrufliste/Anruf">
        <xsl:element name="Anruf" use-attribute-sets="Schluessel">
          <xsl:apply-templates select="Von"/>
          <xsl:apply-templates select="Nach"/>
          <xsl:apply-templates select="Tarif"/>
        </xsl:element>
      </xsl:for-each>
    </Anrufliste>
  </xsl:template>
  <!-- Kopiervorlage -->
  <xsl:template match="Von | Nach | Tarif">
    <xsl:copy use-attribute-sets="Schluessel"/>
    <xsl:apply-templates select="Summe"/>
  </xsl:template>
  <xsl:template match="Summe">
    <xsl:copy>
      <xsl:value-of select="."/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
