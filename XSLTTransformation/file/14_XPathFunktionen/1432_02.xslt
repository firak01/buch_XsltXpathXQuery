<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>ohne Duplikate</th>
            <th>Ausschnitt</th>
            <th>Umkehrung</th>
            <th>Löschung</th>
            <th>Einfügung</th>
            <th>Ordnung</th>
          </tr>
          <tr>
            <xsl:variable name="Tarife-Lang" select="//Posten"/>
            <xsl:variable name="Tarife-Kurz" select="subsequence($Tarife-Lang,1,5)"/>
            <td>
              <xsl:for-each select="distinct-values($Tarife-Lang/Tarif)">
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="$Tarife-Kurz">
                <xsl:value-of select="(Tarif, Einzeln)" separator=" "/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="reverse($Tarife-Kurz)">
                <xsl:value-of select="(Tarif, Einzeln)" separator=" "/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="remove($Tarife-Kurz,1)">
                <xsl:value-of select="(Tarif, Einzeln)" separator=" "/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="insert-before($Tarife-Kurz/Tarif,2,'Test')">
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
            </td>
            <td>
              <xsl:for-each select="unordered($Tarife-Kurz/Tarif)">
              <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
