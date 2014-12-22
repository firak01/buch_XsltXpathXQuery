<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Telefontarife</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Tarifliste/Tarif" mode="Uebersicht"/>
        </ul>
        <xsl:apply-templates select="Tarifliste/Tarif" mode="Details"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Tarif (Uebersicht) -->
  <xsl:template match="Tarif" mode="Uebersicht">
    <li>
      <xsl:value-of select="Name"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Tarif (Details) -->
  <xsl:template match="Tarif" mode="Details">
    <p>
      <b>
        <xsl:value-of select="Name"/>
        <xsl:text> Nr: </xsl:text>
        <xsl:value-of select="Name/@Nr"/>
      </b>
      <br/>
      <xsl:text>Gültigkeit: </xsl:text>
      <xsl:value-of select="Gueltigkeit/Datum/Von"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="Gueltigkeit/Datum/Bis"/>
      <xsl:text> | Dauer: </xsl:text>
      <xsl:value-of select="Gueltigkeit/Uhrzeit/Von"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="Gueltigkeit/Uhrzeit/Bis"/>
    </p>
  </xsl:template>
</xsl:stylesheet>
