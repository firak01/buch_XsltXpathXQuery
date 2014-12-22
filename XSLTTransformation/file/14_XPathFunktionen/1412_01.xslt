<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <!-- Tabelle -->
        <table border="1" cellpadding="1">
          <!-- Spaltenköpfe -->
          <tr>
            <th>Name</th>
            <th>Durchschnitt</th>
            <th>Minimum</th>
            <th>Maximum</th>
            <th>Spannweite</th>
            <th>Anzahl</th>
            <th>Summe</th>
          </tr>
          <!-- Kundenausgabe -->
          <xsl:for-each select="//Name">
            <tr>
              <td>
                <xsl:value-of select="(@Anrede, Vorname, Nachname)" separator=" "/>
              </td>
              <xsl:apply-templates select="ancestor::Rechnung/Postenliste"/>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Postenliste -->
  <xsl:template match="Postenliste">
    <td>
      <xsl:value-of select="avg(Posten/Einzeln)"/>
    </td>
    <td>
      <xsl:value-of select="min(Posten/Einzeln)"/>
    </td>
    <td>
      <xsl:value-of select="max(Posten/Einzeln)"/>
    </td>
    <td>
      <xsl:value-of select="max(Posten/Einzeln)-min(Posten/Einzeln)"/>
    </td>
    <td>
      <xsl:value-of select="count(Posten)"/>
    </td>
    <td>
      <xsl:value-of select="sum(Posten/Einzeln)"/>
    </td>
  </xsl:template>
</xsl:stylesheet>
