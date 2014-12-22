<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Vervielfältigung von Zeichenketten -->
  <xsl:template name="Einzug">
    <xsl:param name="Zeichen" select="' '"/>
    <xsl:param name="Grenze" select="'5'"/>
    <xsl:param name="Zaehler" select="'1'"/>
    <xsl:value-of select="$Zeichen"/>
    <xsl:if test="not($Grenze = $Zaehler)">
      <xsl:call-template name="Einzug">
        <xsl:with-param name="Grenze" select="$Grenze"/>
        <xsl:with-param name="Zeichen" select="$Zeichen"/>
        <xsl:with-param name="Zaehler" select="$Zaehler + 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- Ausgabe eines Postentitels -->
  <xsl:template name="Postentitel">
    <!-- Ausgabe Tarif -->
    <xsl:value-of select="Tarif"/>
    <xsl:text>&#xD;</xsl:text>
    <!-- Ausgabe Linie -->
    <xsl:call-template name="Einzug">
      <xsl:with-param name="Zeichen" select="'-'"/>
      <xsl:with-param name="Grenze" select="string-length(Tarif)"/>
    </xsl:call-template>
    <xsl:text>&#xD;</xsl:text>
  </xsl:template>
  <!-- Ausgabe Rechnungstitel -->
  <xsl:template name="Rechnungstitel">
    <xsl:param name="Name"/>
    <xsl:variable name="Leerzeichen" select="'10'"/>
    <xsl:variable name="Standardlaenge" select="string-length($Name) + $Leerzeichen"/>
    <xsl:variable name="Einrueckung" select="$Leerzeichen div 2 - 1"/>
    <!-- Ausgabe 1. Reihe -->
    <xsl:call-template name="Einzug">
      <xsl:with-param name="Zeichen" select="'*'"/>
      <xsl:with-param name="Grenze" select="$Standardlaenge"/>
    </xsl:call-template>
    <xsl:text>&#xD;</xsl:text>
    <!-- Ausgabe 2. Reihe -->
    <xsl:text>*</xsl:text>
    <!-- Einrueckung links -->
    <xsl:call-template name="Einzug">
      <xsl:with-param name="Grenze" select="$Einrueckung"/>
    </xsl:call-template>
    <!-- Ausgabe Name -->
    <xsl:value-of select="$Name"/>
    <!-- Einrueckung rechts -->
    <xsl:call-template name="Einzug">
      <xsl:with-param name="Grenze" select="$Einrueckung"/>
    </xsl:call-template>
    <xsl:text>*&#xD;</xsl:text>
    <!-- Ausgabe 3. Reihe -->
    <xsl:call-template name="Einzug">
      <xsl:with-param name="Zeichen" select="'*'"/>
      <xsl:with-param name="Grenze" select="$Standardlaenge"/>
    </xsl:call-template>
    <xsl:text>&#xD;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
