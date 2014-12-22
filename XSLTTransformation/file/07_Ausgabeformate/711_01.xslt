<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:decimal-format decimal-separator="," grouping-separator="." name="euro"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Umsatzübersicht</title>
        <link href="text.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
          <xsl:comment>
li {
	font-size: 11px;
	color: #666666;
	list-style-type: square;
}
h1 {
	font-size: 12px;
}
</xsl:comment>
        </style>
      </head>
      <body>
        <h1>Umsatzübersicht</h1>
        <ul>
          <xsl:for-each select="Umsatzuebersicht/Tarif">
            <xsl:sort data-type="number" select="Umsatz" order="descending"/>
            <xsl:if test="Umsatz &gt; 0">
              <li>
                <xsl:value-of select="format-number(Umsatz, '##.###,00 Euro', 'euro')"/>
              </li>
            </xsl:if>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
