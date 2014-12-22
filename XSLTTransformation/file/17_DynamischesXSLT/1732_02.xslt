<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/paeckchenstruktur">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">1.0</xsl:attribute>
      <xsl:element name="xsl:output">
        <xsl:attribute name="method">html</xsl:attribute>
        <xsl:attribute name="version">1.0</xsl:attribute>
        <xsl:attribute name="encoding">UTF-8</xsl:attribute>
        <xsl:attribute name="indent">yes</xsl:attribute>
      </xsl:element>
      <xsl:for-each select="paeckchen">
        <xsl:copy-of select="document(@name)/xsl:stylesheet/child::*[local-name(.) != 'output']"/>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
