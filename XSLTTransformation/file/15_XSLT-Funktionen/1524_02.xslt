<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Globale Parameter -->
  <xsl:param name="head"/>
  <xsl:param name="logo"/>
  <!-- Startvorlage -->
  <xsl:template match="/table">
    <html>
      <xsl:copy-of select="document($head)/*"/>
      <body>
        <xsl:copy-of select="document($logo)/*"/>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für title -->
  <xsl:template match="title">
    <h1>
      <xsl:value-of select="."/>
    </h1>
  </xsl:template>
  <!-- Vorlage für tgroup -->
  <xsl:template match="tgroup">
    <table border="1">
      <xsl:apply-templates/>
    </table>
  </xsl:template>
<xsl:include href="1524_vorlagen.xslt"/>
</xsl:stylesheet>
