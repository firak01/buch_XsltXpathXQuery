<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Umsatz">
    <Rechnungen>
      <xsl:for-each select="Rechnungen/Rechnung">
      <Rechnung>
        <xsl:copy-of select="@* | Total | Kunde"/><!--  -->
        <Postenliste>
          <xsl:for-each select="Postenliste/Posten">
            <Posten>
              <xsl:copy-of select="Nr | Einzeln"/>
              <Tarif>
                <xsl:value-of select="//Tarif[Nr=current()/Tarif]/Name"/>
              </Tarif>
            </Posten>
          </xsl:for-each>
        </Postenliste>
        </Rechnung>
      </xsl:for-each>
    </Rechnungen>
  </xsl:template>
</xsl:stylesheet>
