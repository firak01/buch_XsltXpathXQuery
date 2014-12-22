<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Vorlage für Element Name -->
  <xsl:template match="Name">
    <xsl:value-of select="Rufname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Zuname"/>
  </xsl:template>
</xsl:stylesheet>
