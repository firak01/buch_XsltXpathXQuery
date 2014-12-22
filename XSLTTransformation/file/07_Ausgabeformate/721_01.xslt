<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" 
       encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <Umsatzzahlen>
      <xsl:for-each select="Umsatzuebersicht/Tarif">
        <xsl:sort data-type="number" select="Umsatz" 
             order="descending"/>
        <xsl:element name="Umsatz">
          <xsl:attribute name="Nr"><xsl:value-of 
               select="@Nr"/></xsl:attribute>
          <xsl:attribute name="Typ"><xsl:value-of 
               select="@Typ"/></xsl:attribute>
          <xsl:element name="Tarif">
            <xsl:value-of select="Name"/>
          </xsl:element>
          <xsl:element name="Summe">
            <xsl:value-of select="Umsatz"/>
          </xsl:element>
        </xsl:element>
      </xsl:for-each>
    </Umsatzzahlen>
  </xsl:template>
</xsl:stylesheet>
