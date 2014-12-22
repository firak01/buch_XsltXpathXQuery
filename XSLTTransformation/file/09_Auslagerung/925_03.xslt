<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde" priority="2.0">
    <br/>
    <xsl:text>Kunde seit: </xsl:text>
    <xsl:value-of select="@Beginn"/>
  </xsl:template>
</xsl:stylesheet>
