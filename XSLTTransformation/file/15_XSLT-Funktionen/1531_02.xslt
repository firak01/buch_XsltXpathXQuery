<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Schlüssel -->
  <xsl:key name="TSchluessel" match="Tarif" use="Nr"/>
  <!-- Umwandlung -->
  <xsl:template match="/Umsatz">
    <Rechnungen>
      <xsl:for-each select="Rechnungen/Rechnung">
        <xsl:copy-of select="Total | Kunde | @*"/>
        <Postenliste>
          <xsl:for-each select="Postenliste/Posten">
            <Posten>
              <xsl:copy-of select="Nr | Einzeln"/>
              <Tarif>
                <xsl:value-of select="key('TSchluessel', Tarif)/Name"/>
              </Tarif>
            </Posten>
          </xsl:for-each>
        </Postenliste>
      </xsl:for-each>
    </Rechnungen>
  </xsl:template>
</xsl:stylesheet>
