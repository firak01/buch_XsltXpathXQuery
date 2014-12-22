<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Vorlage für Element Kunde -->
  <xsl:template match="Kunde">
    <p>
      <xsl:value-of select="@Anrede"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="Name"/>
      <br/>
      <xsl:apply-templates select="Adresse"/>
    </p>
  </xsl:template>
</xsl:stylesheet>
