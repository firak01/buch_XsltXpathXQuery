<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:apply-templates/>
        </title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="/Text/Gruss">
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
