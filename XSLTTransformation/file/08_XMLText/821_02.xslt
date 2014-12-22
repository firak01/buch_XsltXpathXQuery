<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <!--Datenausgabe -->
    <xsl:for-each select="/*/*">
      <xsl:text>INSERT INTO </xsl:text>
      <xsl:value-of select="local-name(/*)"/>
      <!--Spaltenliste -->
      <xsl:text> (</xsl:text>
      <xsl:for-each select="/*/*[1]/@*">
        <xsl:value-of select="local-name(.)"/>
        <!--Trenner -->
        <xsl:if test="not(position()=last())">
          <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>) &#xD;</xsl:text>
      <xsl:text> VALUES (</xsl:text>
      <xsl:for-each select="@*">
        <xsl:text> '</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text> ' </xsl:text>
        <!--Trenner -->
        <xsl:if test="not(position()=last())">
          <xsl:text>, </xsl:text>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>); &#xD;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
