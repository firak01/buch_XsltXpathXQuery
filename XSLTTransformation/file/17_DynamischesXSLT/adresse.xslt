<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Vorlage für Element Adresse -->
  <xsl:template match="Adresse">
    <xsl:value-of select="Strasse"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="PLZ"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Stadt"/>
  </xsl:template>
</xsl:stylesheet>
