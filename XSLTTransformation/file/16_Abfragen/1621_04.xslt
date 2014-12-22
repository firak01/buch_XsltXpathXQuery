<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/*">
    <Umsatzliste>
      <xsl:for-each select="//Rechnung">
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <Postenliste>
            <xsl:call-template name="natural-join">
              <xsl:with-param name="tabelle" select="'Posten'"/>
            </xsl:call-template>
          </Postenliste>
        </xsl:copy>
      </xsl:for-each>
    </Umsatzliste>
  </xsl:template>
  <!-- Vorlage zur Auswahl -->
  <xsl:template name="natural-join">
    <xsl:param name="tabelle"/>
    <xsl:for-each select="@*">
      <xsl:variable name="att-name" select="local-name(.)"/>
      <xsl:variable name="schluessel" select="."/>
      <xsl:for-each select="//*[local-name()=$tabelle]">
        <xsl:if test="@*[local-name()=$att-name]=$schluessel">
          <xsl:copy-of select="."/>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
