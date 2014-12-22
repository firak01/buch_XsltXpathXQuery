<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Rechnung</title>
      </head>
      <body>
        <xsl:for-each select="//Rechnung">
          <xsl:apply-templates select="Kunde"/>
          <xsl:apply-templates select="Postenliste"/>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Postenliste -->
  <xsl:template match="Postenliste">
    <xsl:for-each select="Posten">
      <p>
        <xsl:number count="Posten" format="1." level="any"/>
        <xsl:text> Tarif: </xsl:text>
        <xsl:value-of select="Tarif"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="Einzeln"/>
      </p>
    </xsl:for-each>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <h1>
      <xsl:number count="//Rechnung" format="I.) " level="single"/>Rechnung für 
<xsl:value-of select="Name/Vorname"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="Name/Nachname"/>
    </h1>
  </xsl:template>
</xsl:stylesheet>
