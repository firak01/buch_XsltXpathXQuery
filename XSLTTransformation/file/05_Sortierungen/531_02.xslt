<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:key name="MSchluessel" match="Erfolg" use="Monat"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundengewinnung</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Monat</th>
            <th>Neukunden</th>
            <th>Gesamt</th>
            <th>Stadt</th>
          </tr>
          <xsl:for-each select="//Erfolg[generate-id(.)=generate-id(key('MSchluessel', Monat)[1])]">
            <xsl:sort select="Monat" data-type="number" order="ascending"/>
            <xsl:for-each select="key('MSchluessel', Monat)">
              <xsl:sort select="Umsatz/Gesamt"/>
              <xsl:sort select="Umsatz/Neukunden"/>
              <tr align="center">
                <xsl:if test="position() = 1">
                  <th valign="center">
                    <xsl:attribute name="rowspan"><xsl:value-of select="count(key('MSchluessel', Monat))"/></xsl:attribute>
                    <xsl:value-of select="Monat"/>
                  </th>
                </xsl:if>
                <td>
                  <xsl:value-of select="Umsatz/Neukunden"/>
                </td>
                <td>
                  <xsl:value-of select="Umsatz/Gesamt"/>
                </td>
                <td>
                  <xsl:value-of select="Stadt"/>
                </td>
              </tr>
            </xsl:for-each>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
