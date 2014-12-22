<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="rf" xmlns:rf="http://www.ruhrfon.biz">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Tarifliste">
    <Tarifliste xsi:noNamespaceSchemaLocation="212_01.xsd">
      <xsl:for-each select="Tarif">
        <Tarif>
          <xsl:copy-of select="Name"/>
          <Gueltigkeit>
            <!-- Umwandlung in xs:date -->
            <xsl:for-each select="Gueltigkeit/child::*">
              <xsl:copy>
                <xsl:value-of select="rf:liefereDatum(.,'Element')"/>
              </xsl:copy>
            </xsl:for-each>
          </Gueltigkeit>
          <Uhrzeit>
            <!-- Umwandlung in xs:time -->
            <xsl:for-each select="Uhrzeit/child::*">
              <xsl:copy>
                <xsl:value-of select="rf:liefereUhrzeit(.)"/>
              </xsl:copy>
            </xsl:for-each>
          </Uhrzeit>
          <!-- Umwandlung in xs:decimal -->
          <Umsatz>
            <xsl:for-each select="Umsatz/child::*">
              <xsl:copy>
                <xsl:value-of select="rf:liefereDezimalzahl(.)"/>
              </xsl:copy>
            </xsl:for-each>
          </Umsatz>
        </Tarif>
      </xsl:for-each>
    </Tarifliste>
  </xsl:template>
  <!-- Vorlage zur Datumsumwandlung -->
  <xsl:function name="rf:liefereDatum">
    <!-- Parameter -->
    <xsl:param name="deutschesDatum"/>
    <xsl:param name="Ausgabetyp"/>
    <!-- Variablen zu Ausgabe -->
    <xsl:variable name="Tag" select="substring($deutschesDatum/text(), 1,2)"/>
    <xsl:variable name="Monat" select="substring($deutschesDatum/text(), 4,2)"/>
    <xsl:variable name="Jahr" select="concat('20',substring($deutschesDatum/text(), 7,2))"/>
    <xsl:variable name="ISODatum" select="concat($Jahr, '-', $Monat, '-', $Tag)"/>
    <!-- Ausgabe -->
    <xsl:choose>
      <xsl:when test="$Ausgabetyp = 'Element'">
        <xsl:element name="{local-name($deutschesDatum)}">
          <xsl:value-of select="$ISODatum"/>
        </xsl:element>
      </xsl:when>
      <xsl:when test="$Ausgabetyp = 'Attribut'">
        <xsl:attribute name="{local-name($deutschesDatum)}">
          <xsl:value-of select="$ISODatum"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
  </xsl:function>
  <!-- Vorlage zur Stundenumwandlung -->
  <xsl:function name="rf:liefereUhrzeit">
    <!-- Parameter -->
    <xsl:param name="Stunde"/>
    <!-- Ausgabe -->
    <xsl:element name="{local-name($Stunde)}">
      <xsl:choose>
        <xsl:when test="not($Stunde =' 24')">
          <xsl:value-of select="concat($Stunde/text(),':00:00')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>00:00:00</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:function>
  <!-- Vorlage zur Zahlenumwandlung -->
  <xsl:function name="rf:liefereDezimalzahl">
    <!-- Parameter -->
    <xsl:param name="deutscheZahl"/>
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
        <xsl:when test="not($Zeichen = ',' or $Zeichen = '.')">
          <xsl:value-of select="$Zeichen"/>
        </xsl:when>
      </xsl:choose>
      <!-- Rekursiver Aufruf -->
      <xsl:value-of select="rf:liefereDezimalzahl($neueDeutscheZahl)"/>
    </xsl:if>
  </xsl:function>
</xsl:stylesheet>
