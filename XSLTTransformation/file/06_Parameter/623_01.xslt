<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Variablen mit einfachen Werten -->
  <xsl:variable name="Gesamtsumme" select="sum(//Total)"/>
  <xsl:variable name="AnzahlRechnungen" select="count(//Rechnung)"/>
  <xsl:variable name="Durchschnitt" select="$Gesamtsumme div $AnzahlRechnungen"/>
  <!-- Variablen mit Fragmentbäumen -->
  <xsl:variable name="PostenSatz" select="//Posten"/>
  <xsl:variable name="Kunden" select="//Kunde/Name"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Umsatz</title>
      </head>
      <body>
        <h1>Statistik</h1>
        <ul>
          <!-- Verarbeitung von Variablen mit einfachen Werten -->
          <li>Gesamtumsatz: 
      <xsl:value-of select="concat($Gesamtsumme, ' Euro')"/>
          </li>
          <li>Durchschnitt <xsl:value-of select="concat($Durchschnitt, ' Euro')"/>
          </li>
          <!-- Verarbeitung von Variablen mit Fragmenten -->
          <li>Anzahl Posten: 
            <xsl:value-of select="count($PostenSatz)"/>
          </li>
          <li>Tagsüber: 
            <xsl:value-of select="sum($PostenSatz[Tarif='Frühstück' or Tarif='Mittagspause']/Einzeln)"/>
          </li>
          <li>Abends / nachts: 
            <xsl:value-of select="sum($PostenSatz[Tarif='Abendessen' or Tarif='Mondschein1']/Einzeln)"/>
          </li>
          <li>Kunden: <xsl:for-each select="$Kunden">
              <xsl:value-of select="Nachname"/>
              <xsl:choose>
                <xsl:when test="not(position()=last())">
                  <xsl:text>, </xsl:text>
                </xsl:when>
                <xsl:otherwise>.</xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </li>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
