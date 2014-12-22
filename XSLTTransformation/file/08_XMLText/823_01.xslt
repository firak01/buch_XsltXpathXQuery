<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:include href="textdekoration.xslt"/>
  <xsl:template match="/">
    <!-- Ausgabe Anschrift -->
    <xsl:call-template name="Rechnungstitel">
      <xsl:with-param name="Name">
        <xsl:value-of select="Rechnung/Kunde/Name/@Anrede"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Rechnung/Kunde/Name/Vorname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="Rechnung/Kunde/Name/Nachname"/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text>&#xD;</xsl:text>
    <!-- Ausgabe der Rechnungsposten -->
    <xsl:for-each select="Rechnung/Details/Posten">
      <xsl:call-template name="Postentitel"/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
