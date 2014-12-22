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
          <xsl:if test="function-available('runden')">
            <xsl:for-each select="Postenliste/Posten">
              <xsl:choose>
                <xsl:when test="Einzeln[runden(number(text()))=0]">
                  <xsl:call-template name="Posten">
                    <xsl:with-param name="Kategorie" select="1"/>
                  </xsl:call-template>
                </xsl:when>
                <!-- ... -->
              </xsl:choose>
            </xsl:for-each>
          </xsl:if>
          <!-- Standardverhalten, in Reihe ausgeführt -->
          <xsl:fallback>
            <p>Rückgriff 1</p>
          </xsl:fallback>
          <xsl:fallback>
            <p>Rückgriff 2</p>
          </xsl:fallback>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <!-- Allgemeine Standardvorlage, die nie ausgeführt wird -->
  <xsl:template name="Standard">
    <xsl:fallback>
      <p>Rückgriff 3</p>
    </xsl:fallback>
  </xsl:template>
  <!-- Vorlage für Posten -->
  <xsl:template name="Posten">
    <xsl:param name="Kategorie"/>
    <xsl:message>Wert von $Kategorie: <xsl:value-of select="$Kategorie"/>
    </xsl:message>
    <p>
      <img src="strich.gif" alt="Kategorie" align="left" width="{$Kategorie}0" height=" 10"/>
      <xsl:text>Tarif: </xsl:text>
      <xsl:value-of select="Tarif"/>
      <xsl:text> | </xsl:text>
      <xsl:value-of select="Einzeln"/>
    </p>
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
