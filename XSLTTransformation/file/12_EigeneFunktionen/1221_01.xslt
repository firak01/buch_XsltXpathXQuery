<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Tarifliste">
    <Tarifliste xsi:noNamespaceSchemaLocation="1221_01.xsd">
      <xsl:for-each select="Tarif">
        <Tarif>
          <xsl:copy-of select="Name"/>
          <Gueltigkeit>
            <!-- Umwandlung in xs:date -->
            <xsl:call-template name="liefereDatumInAttribut">
              <xsl:with-param name="deutschesDatum" select="Gueltigkeit/Von"/>
              <xsl:with-param name="Name" select="'Start'"/>
            </xsl:call-template>
            <xsl:call-template name="liefereDatumInAttribut">
              <xsl:with-param name="deutschesDatum" select="Gueltigkeit/Bis"/>
              <xsl:with-param name="Name" select="'Ende'"/>
            </xsl:call-template>
          </Gueltigkeit>
          <Uhrzeit>
            <!-- Umwandlung in xs:time -->
            <xsl:for-each select="Uhrzeit/child::*">
              <xsl:call-template name="liefereUhrzeit">
                <xsl:with-param name="Stunde" select="."/>
              </xsl:call-template>
            </xsl:for-each>
          </Uhrzeit>
          <!-- Umwandlung in xs:decimal -->
          <Umsatz>
            <xsl:for-each select="Umsatz/child::*">
              <xsl:copy>
                <xsl:call-template name="liefereDezimalzahl">
                  <xsl:with-param name="deutscheZahl" select="."/>
                </xsl:call-template>
              </xsl:copy>
            </xsl:for-each>
          </Umsatz>
        </Tarif>
      </xsl:for-each>
    </Tarifliste>
  </xsl:template>
  <!-- Vorlage zur Datumsumwandlung -->
  <xsl:template name="liefereDatumInElement">
    <!-- Parameter -->
    <xsl:param name="deutschesDatum"/>
    <xsl:param name="Name"/>
    <!-- Ausgabe -->
    <xsl:element name="{$Name}">
      <xsl:call-template name="liefereDatum">
        <xsl:with-param name="deutschesDatum" select="$deutschesDatum"/>
      </xsl:call-template>
    </xsl:element>
  </xsl:template>
  <xsl:template name="liefereDatumInAttribut">
    <!-- Parameter -->
    <xsl:param name="deutschesDatum"/>
    <xsl:param name="Name"/>
    <!-- Ausgabe -->
    <xsl:attribute name="{$Name}"><xsl:call-template name="liefereDatum"><xsl:with-param name="deutschesDatum" select="$deutschesDatum"/></xsl:call-template></xsl:attribute>
  </xsl:template>
  <xsl:template name="liefereDatum">
    <!-- Parameter -->
    <xsl:param name="deutschesDatum"/>
    <!-- Variablen zu Ausgabe -->
    <xsl:variable name="Tag" select="substring($deutschesDatum/text(), 1,2)"/>
    <xsl:variable name="Monat" select="substring($deutschesDatum/text(), 4,2)"/>
    <xsl:variable name="Jahr" select="concat('20',substring($deutschesDatum/text(), 7,2))"/>
    <!-- Ausgabe -->
    <xsl:value-of select="concat($Jahr, '-', $Monat, '-', $Tag)"/>
  </xsl:template>
  <!-- Vorlage zur Stundenumwandlung -->
  <xsl:template name="liefereUhrzeit">
    <!-- Parameter -->
    <xsl:param name="Stunde"/>
    <!-- Ausgabe -->
    <xsl:element name="{local-name($Stunde)}">
      <xsl:choose>
        <xsl:when test="not($Stunde = 24)">
          <xsl:value-of select="concat($Stunde/text(),':00:00')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>00:00:00</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <!-- Vorlage zur Zahlenumwandlung -->
  <xsl:template name="liefereDezimalzahl">
    <!-- Parameter -->
    <xsl:param name="deutscheZahl"/>
    <xsl:message>Aufruf
      <xsl:value-of select="$deutscheZahl"/>
    </xsl:message>
    <!-- Variablen -->
    <xsl:variable name="Zeichen" select="substring($deutscheZahl, 1,1)"/>
    <xsl:variable name="Laenge" select="string-length($deutscheZahl)"/>
    <xsl:variable name="neueDeutscheZahl" select="substring($deutscheZahl, 2, $Laenge)"/>
    <!-- Ausgabe -->
    <xsl:if test="not($Laenge = 0)">
      <!-- Ersetzung -->
      <xsl:choose>
        <xsl:when test="$Zeichen = ','">
          <xsl:text>.</xsl:text>
        </xsl:when>
        <xsl:when test="$Zeichen = '.'"/>
        <xsl:otherwise>
          <xsl:value-of select="$Zeichen"/>
        </xsl:otherwise>
      </xsl:choose>
      <!-- Rekursiver Aufruf -->
      <xsl:call-template name="liefereDezimalzahl">
        <xsl:with-param name="deutscheZahl" select="$neueDeutscheZahl"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
