<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Vorlage für Kunde -->
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
