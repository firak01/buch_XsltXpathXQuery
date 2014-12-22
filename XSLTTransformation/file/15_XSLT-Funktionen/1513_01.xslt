<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <h3>unparsed-entity-uri()</h3>
        <b>unparsed-entity-uri('pic')</b> = 
               <xsl:value-of select="unparsed-entity-uri('pic')"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
