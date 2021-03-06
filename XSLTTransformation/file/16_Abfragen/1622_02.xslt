<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/*">
    <Tarifliste>
      <xsl:for-each select="//Tarif[not(contains(string-join(//Posten/@T_Nr, '|'), @T_Nr))]">
        <xsl:copy-of select="current()"/>
      </xsl:for-each>
    </Tarifliste>
  </xsl:template>
</xsl:stylesheet>
