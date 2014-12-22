<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:param name="Trenner" select="','"/>
  <xsl:param name="Feld" select="''"/>
  <xsl:param name="Spaltenkoepfe" select="'TRUE'"/>
  <xsl:template match="/">
    <xsl:if test="$Spaltenkoepfe = 'TRUE'">
      <!--Spaltenköpfe -->
      <xsl:for-each select="/*/*[1]/@*">
        <!-- Feldauszeichnung links -->
        <xsl:call-template name="Feldauszeichnung"/>
        <xsl:value-of select="local-name(.)"/>
        <!-- Feldauszeichnung rechts -->
        <xsl:call-template name="Feldauszeichnung"/>
        <!--Trenner -->
        <xsl:if test="not(position()=last())">
          <xsl:value-of select="$Trenner"/>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>&#xD;</xsl:text>
    </xsl:if>
    <!--Datenausgabe -->
    <xsl:for-each select="/*/*">
      <xsl:for-each select="@*">
        <!-- Feldauszeichnung links -->
        <xsl:call-template name="Feldauszeichnung"/>
        <xsl:value-of select="."/>
        <!-- Feldauszeichnung rechts -->
        <xsl:call-template name="Feldauszeichnung"/>
        <!--Trenner -->
        <xsl:if test="not(position()=last())">
          <xsl:value-of select="$Trenner"/>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>&#xD;</xsl:text>
    </xsl:for-each>
  </xsl:template>
  <!-- Feldauszeichnung -->
  <xsl:template name="Feldauszeichnung">
    <xsl:if test="$Feld != ''">
      <xsl:value-of select="$Feld"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
