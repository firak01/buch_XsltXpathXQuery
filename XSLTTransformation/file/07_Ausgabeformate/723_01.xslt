<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <Anrufliste>
      <xsl:attribute name="xsi:noNamespaceSchemaLocation">723_02.xsd</xsl:attribute>
      <xsl:for-each select="Anrufliste/Anruf">
        <xsl:element name="Anruf">
          <xsl:attribute name="Nr"><xsl:value-of select="@Nr"/></xsl:attribute>
          <xsl:copy-of select="Von"/>
          <xsl:copy-of select="Tarif"/>
        </xsl:element>
      </xsl:for-each>
    </Anrufliste>
  </xsl:template>
</xsl:stylesheet>
