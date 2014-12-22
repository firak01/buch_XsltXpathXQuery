<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1"/>
  <xsl:template name="Einzug">
    <xsl:param name="Grenze"/>
    <xsl:param name="Zaehler" select="0"/>
    <xsl:param name="Wert" select="' '"/>
    <xsl:value-of select="$Wert"/>
<xsl:message> <xsl:value-of select="$Zaehler"/></xsl:message>
    <xsl:if test="number($Grenze) &lt;= number($Zaehler)">
      <xsl:call-template name="Einzug">
        <xsl:with-param name="Zaehler" select="$Zaehler+1"/>
        <xsl:with-param name="Wert" select="$Wert"/>
        <xsl:with-param name="Grenze" select="$Grenze"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
