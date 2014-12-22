<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:variable name="Gesamtsumme" select="sum(//Total)"/>
  <xsl:variable name="AnzahlRechnungen" select="count(//Rechnung)"/>
  <xsl:variable name="Durchschnitt" select="$Gesamtsumme div $AnzahlRechnungen"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Umsatz</title>
      </head>
      <body>
        <h1>Rechnungen</h1>
        <xsl:for-each select="//Rechnung">
          <xsl:apply-templates select="Kunde"/>
          <!-- Allgemeine Daten -->
          <xsl:variable name="Summe" select="Total"/>
          <ul>
            <li>Gesamtumsatz: 
      <xsl:value-of select="concat($Gesamtsumme, ' Euro')"/>
            </li>
            <li>Durchschnitt <xsl:value-of select="concat($Durchschnitt, ' Euro')"/>
            </li>
            <li>
              <xsl:value-of select="concat(round(($Summe div $Gesamtsumme)*100), ' %')"/>
            </li>
          </ul>
          <!-- Postendaten -->
          <table border="1">
            <tr>
              <th>Posten</th>
              <th>Summe</th>
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
        <xsl:value-of select="concat(round((Einzeln div $Gesamtsumme)*100), ' %')"/>
      </td>
    </tr>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <h2>
      <xsl:value-of select="Name/Vorname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Name/Nachname"/>
    </h2>
  </xsl:template>
</xsl:stylesheet>
