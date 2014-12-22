<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Neukundengewinnung</title>
      </head>
      <body>
        <h1>Neukundengewinnung</h1>
        <xsl:for-each-group select="Erfolguebersicht/child::*" group-starting-with="Quartal">
          <h2>Quartal   <xsl:value-of select="self::Quartal"/>
          </h2>
          <table border="1">
            <th>Monat</th>
            <th>Stadt</th>
            <th>Neukunden</th>
            <th>Gesamt</th>
            <xsl:for-each select="current-group()[self::Erfolg]">
              <tr>
                <td>
                  <xsl:value-of select="Monat"/>
                </td>
                <td>
                  <xsl:value-of select="Stadt"/>
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
        </xsl:for-each-group>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
