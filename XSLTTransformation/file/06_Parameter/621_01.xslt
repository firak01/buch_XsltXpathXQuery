<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Umsatz</title>
      </head>
      <body>
        <xsl:for-each select="//Rechnung">
          <xsl:apply-templates select="Kunde"/>
          <table border="1">
            <tr>
              <th>Posten</th>
              <th>Summe</th>
              <th>Kumuliert auf</th>
              <th>Kumuliert ab</th>
              <th>Prozent</th>
            </tr>
            <xsl:for-each select="Postenliste/Posten">
              <xsl:call-template name="Umsatzausgabe"/>
            </xsl:for-each>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Umsatzausgabe -->
  <xsl:template name="Umsatzausgabe">
    <xsl:variable name="Summe" select="ancestor::Rechnung/Total"/>
    <xsl:variable name="Kumuliert" select="sum(preceding-sibling::Posten/Einzeln)+Einzeln"/>
    <xsl:variable name="Differenz" select="$Summe -$Kumuliert"/>
    <tr>
      <td>
        <xsl:value-of select="Tarif"/>
      </td>
      <td>
        <xsl:value-of select="Einzeln"/>
      </td>
      <td>
        <xsl:value-of select="$Kumuliert"/>
      </td>
      <td>
        <xsl:value-of select="$Differenz"/>
      </td>
      <td>
        <xsl:value-of select="concat(round((Einzeln div $Summe)*100), ' %')"/>
      </td>
    </tr>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <h1>
      <xsl:value-of select="Name/Vorname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Name/Nachname"/>
    </h1>
  </xsl:template>
</xsl:stylesheet>
