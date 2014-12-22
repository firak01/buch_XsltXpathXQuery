<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Globale Parameter -->
  <xsl:param name="head"/>
  <xsl:param name="logo"/>
  <!-- Startvorlage -->
  <xsl:template match="/table">
    <html>
      <xsl:value-of select="unparsed-text($head, 'ISO-8859-1')" disable-output-escaping="yes"/>
      <body>
        <xsl:value-of select="unparsed-text($logo, 'ISO-8859-1')" disable-output-escaping="yes"/>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="524_vorlagen.xslt"/>
</xsl:stylesheet>
