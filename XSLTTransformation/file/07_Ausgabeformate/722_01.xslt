<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:attribute-set name="TarifAtts">
    <xsl:attribute name="Nr"><xsl:value-of select="@Nr"/></xsl:attribute>
    <xsl:attribute name="Typ"><xsl:value-of select="@Typ"/></xsl:attribute>
  </xsl:attribute-set>
  <xsl:template match="/">
    <xsl:processing-instruction name="xml-stylesheet">
type="text/xsl" href="722_01neu.xslt"
</xsl:processing-instruction>
    <xsl:processing-instruction name="xml-stylesheet">
 href="umsatz.css" type="text/css"
</xsl:processing-instruction>
    <Umsatzzahlen>
      <xsl:attribute name="xsi:noNamespaceSchemaLocation">17_01neu.xsd</xsl:attribute>
      <xsl:for-each select="Umsatzuebersicht/Tarif">
        <xsl:sort data-type="number" select="Umsatz" order="descending"/>
        <xsl:element name="Umsatz" use-attribute-sets="TarifAtts">
          <xsl:element name="Tarif">
            <xsl:value-of select="Name"/>
          </xsl:element>
          <xsl:element name="Summe">
            <xsl:value-of select="Umsatz"/>
          </xsl:element>
        </xsl:element>
      </xsl:for-each>
    </Umsatzzahlen>
  </xsl:template>
</xsl:stylesheet>
