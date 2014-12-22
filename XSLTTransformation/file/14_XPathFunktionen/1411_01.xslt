<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <xsl:variable name="Gesamtumsatz" select="sum(//Total)"/>
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
            <th>Betrag</th>
            <th>Anteil % (2.0)</th>
            <th>Anteil % (1.0)</th>
            <th>Anteil % aufgerundet</th>
            <th>Anteil % abgerundet</th>
          </tr>
          <!-- Kundenausgabe -->
          <xsl:for-each select="//Name">
            <xsl:variable name="Anteil" select="ancestor::Rechnung/Total div $Gesamtumsatz"/>
            <tr>
              <td>
                <xsl:value-of select="(@Anrede, Vorname, Nachname)" separator=" "/>
              </td>
              <td>
                <xsl:value-of select="ancestor::Rechnung/Total"/>
              </td>
              <td>
                <xsl:value-of select="round-half-to-even($Anteil*100, 2)"/>
              </td>
              <td>
                <xsl:value-of select="round($Anteil*100)"/>
              </td>
              <td>
                <xsl:value-of select="ceiling($Anteil*100)"/>
              </td>
              <td>
                <xsl:value-of select="floor($Anteil*100)"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
