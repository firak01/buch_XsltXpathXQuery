<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:param name="Farbe" select="'red'"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Umsatz</title>
      </head>
      <body>
        <xsl:for-each select="//Rechnung">
          <xsl:apply-templates select="Kunde"/>
          <ul>
            <xsl:for-each select="Postenliste/Posten">
              <li>
                <font color="{$Farbe}">
                  <xsl:value-of select="Tarif"/>
                </font>
                <xsl:call-template name="Umsatzvisualisierung">
                  <xsl:with-param name="Summe" select="Einzeln"/>
                </xsl:call-template>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Umsatzvisualisierung -->
  <xsl:template name="Umsatzvisualisierung">
    <xsl:param name="Summe" select="0"/>
    <hr width="{ceiling($Summe)*50}" align="left"/>
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
