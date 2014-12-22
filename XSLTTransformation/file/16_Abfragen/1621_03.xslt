<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Schlüssel -->
  <xsl:key name="r-nr" match="Posten" use="@R_Nr"/>
  <!-- Startvorlage -->
  <xsl:template match="/*">
    <Umsatzliste>
      <xsl:for-each select="//Rechnung">
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:for-each select="key('r-nr', @R_Nr)">
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:copy>
      </xsl:for-each>
    </Umsatzliste>
  </xsl:template>
</xsl:stylesheet>
