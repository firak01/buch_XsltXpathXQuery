<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="." name="deutsch"/>
  <xsl:template match="/Tarifliste">
    <html>
      <head/>
      <body>
        <ul>
          <xsl:for-each select="Tarif">
            <li>
              <xsl:value-of select="Name"/>
              <xsl:text>: </xsl:text>
              <xsl:value-of select="format-number(Umsatz/Summe, '#.###00,##', 'deutsch')"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

