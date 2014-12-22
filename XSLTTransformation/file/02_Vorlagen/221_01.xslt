<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <!--FGL Siehe Buch Seite 73 - bei maxoccurs="unbound" wird das apply-template für alle "Geschwister"-Elemente (hier die Kunden) neu aufgerufen.  -->
        <xsl:apply-templates select="Kundenliste/Kunde"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Element Kunde -->
  <xsl:template match="Kunde">
    <p>
      <xsl:value-of select="@Anrede"/><!-- FGL 20141203 Das @ ist eine Abkürzungsform für den Zugriff aif die Attributachse mit XPath -->
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="Name"/>
      <!-- FGL: In 221_01.xsd erkennt man, dass Name und Adresse direkte Kindelemenete von Kunde sind. Daher sind sie XPath mäßg auch lediglich über den Bezeichner aufrufbar. -->
      <br/>
      <xsl:apply-templates select="Adresse"/>
    </p>
  </xsl:template>
  <!-- Vorlage für Element Name -->
  <xsl:template match="Name">  
    <xsl:value-of select="Rufname"/> <!-- FGL: Aus NameType, siehe 221_01.xsd -->
    <xsl:text> </xsl:text>
    <xsl:value-of select="Zuname"/>
  </xsl:template>
  <!-- Vorlage für Element Adresse -->
  <xsl:template match="Adresse">
    <xsl:value-of select="Strasse"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="PLZ"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Stadt"/>
  </xsl:template>
</xsl:stylesheet>
