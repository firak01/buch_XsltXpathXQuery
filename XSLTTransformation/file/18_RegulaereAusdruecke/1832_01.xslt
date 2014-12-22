<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundenstatistik</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Pos</th>
            <th>Stadt</th>
            <th>Monat</th>
            <th>Neukunden</th>
          </tr>
          <xsl:for-each select="//Erfolg[matches(@Monat, '7|8|10')]">
            <xsl:sort data-type="number" order="descending" select="@Monat"/>
            <tr>
              <td>
                <xsl:value-of select="(position(), ' ')"/>
              </td>
              <td>
                <xsl:value-of select="@Stadt"/>
              </td>
              <!-- Test bei @Monat -->
              <xsl:analyze-string select="@Monat" regex="5|10">
                <xsl:matching-substring>
                  <td>
                    <xsl:value-of select="."/>
                  </td>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                  <td>###</td>
                </xsl:non-matching-substring>
              </xsl:analyze-string>
              <!-- Test bei Neukunden -->
              <xsl:analyze-string select="Neukunden" regex="[0-9]{2}">
                <xsl:matching-substring>
                  <td>
                    <xsl:value-of select="."/>
                  </td>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                  <td>###</td>
                </xsl:non-matching-substring>
              </xsl:analyze-string>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
