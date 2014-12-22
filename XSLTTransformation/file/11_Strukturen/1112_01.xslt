<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <html>
      <head>
        <title>
          <xsl:value-of select="local-name(/*)"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="Rechnung"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Rechnung -->
  <xsl:template match="Rechnung">
    <h1>
      <xsl:value-of select="('Rechnung', @Nr, 'vom',  @Datum)" separator=" "/>
    </h1>
    <xsl:apply-templates/>
  </xsl:template>
  <!-- Vorlage für Total -->
  <xsl:template match="Total">
    <p>
      <xsl:value-of select="(., 'Euro')" separator=" "/>
    </p>
  </xsl:template>
  <!-- Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <p>
      <xsl:value-of select="('Typ:', @Typ, '| Nr:', @Nr)" separator=" "/>
    </p>
    <p>
      <xsl:apply-templates select="Name | Adresse"/>
    </p>
  </xsl:template>
  <!-- Vorlage für Adresse -->
  <xsl:template match="Adresse">
    <xsl:value-of select="(Strasse, 'in', PLZ, Stadt)" separator=" "/>
  </xsl:template>
  <!-- Vorlage für Name -->
  <xsl:template match="Name">
    <xsl:value-of select="(@Anrede, Vorname, Nachname)" separator=" "/>
    <br/>
  </xsl:template>
  <!-- Vorlage für Postenliste -->
  <xsl:template match="Postenliste">
    <ul>
      <xsl:for-each select="Posten">
        <li>
          <xsl:text>(</xsl:text>
          <xsl:value-of select="(@Nr, @RefNr)" separator=" "/>
          <xsl:text>) </xsl:text>
          <xsl:value-of select="(Tarif, Einzeln)" separator=" "/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
