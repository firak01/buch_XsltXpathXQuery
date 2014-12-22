<?xml version='1.0'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output name="htmlDoc" use-character-maps="leerzeichen html-leerzeichen" />

<xsl:character-map name="html-leerzeichen">
  <xsl:output-character character="&#160;" string="&amp;nbsp;" />
  <xsl:output-character character="&#161;" string="&amp;iexcl;" />
</xsl:character-map>

<xsl:character-map name="leerzeichen">
  <!-- Zeilenumbrüche -->
  <xsl:output-character character="&#xA;" string="&#xD;&#xA;" />
  <!-- Tabulatoren -->
  <xsl:output-character character="&#x9;" string="   " />
</xsl:character-map>


...

</xsl:stylesheet>