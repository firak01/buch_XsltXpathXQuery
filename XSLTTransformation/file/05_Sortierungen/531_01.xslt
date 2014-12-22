<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundengewinnung</title>
      </head>
      <body>
        <h1>Neukundengewinnung</h1>
        <xsl:for-each select="Erfolguebersicht/Erfolg">
          <xsl:sort select="Stadt"/>
          <xsl:sort select="Monat" data-type="number" order="ascending"/>
          <xsl:sort select="Umsatz/Neukunden"/>
          <xsl:variable name="letzteStadt" select="Stadt"/>
          <xsl:if test="not(preceding-sibling::Erfolg[Stadt=$letzteStadt])">
            <h2>Stadt  <xsl:value-of select="Stadt"/>
            </h2>
            <table border="1">
              <th>Monat</th>
              <th>Neukunden</th>
              <th>Gesamt</th>
              <xsl:for-each select="/Erfolguebersicht/Erfolg[Stadt=$letzteStadt]">
                <xsl:sort select="Monat" data-type="number" order="ascending"/>
                <xsl:sort select="Umsatz/Neukunden" data-type="number" order="ascending"/>
                <tr>
                  <td>
                    <xsl:value-of select="Monat"/>
                  </td>
                  <td>
                    <xsl:value-of select="Umsatz/Neukunden"/>
                  </td>
                  <td>
                    <xsl:value-of select="Umsatz/Gesamt"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
