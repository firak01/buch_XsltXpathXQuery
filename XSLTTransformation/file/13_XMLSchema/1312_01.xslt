<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:import-schema schema-location="1312_01.xsd"/>
  <xs:variable name="Total" select="sum(//Umsatz)" as="Waehrung"/>
  <xsl:template match="/"><xsl:value-of select="$Total"/></xsl:template>
</xsl:stylesheet>
