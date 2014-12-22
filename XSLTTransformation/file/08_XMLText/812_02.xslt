<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <xsl:element name="xs:schema">
      <xsl:attribute name="elementFormDefault"><xsl:value-of select="xs:schema/@elementFormDefault"/></xsl:attribute>
      <xsl:element name="xs:complexType">
        <xsl:attribute name="name">KundeTyp</xsl:attribute>
        <xsl:copy-of select="//xs:sequence[ancestor::xs:element/@name='Kunde']"/>
        <xsl:copy-of select="//xs:attribute[ancestor::xs:element/@name='Kunde']"/>
      </xsl:element>
      <xsl:attribute name="elementFormDefault"><xsl:value-of select="xs:schema/@elementFormDefault"/></xsl:attribute>
      <xsl:element name="xs:complexType">
        <xsl:attribute name="name">TarifTyp</xsl:attribute>
        <xsl:copy-of select="//xs:sequence[ancestor::xs:element/@name='Tarif']"/>
        <xsl:copy-of select="//xs:attribute[ancestor::xs:element/@name='Tarif']"/>
      </xsl:element>
      <xsl:element name="xs:element">
        <xsl:attribute name="name">Anrufliste</xsl:attribute>
        <xsl:element name="xs:complexType">
          <xsl:element name="xs:sequence">
            <xsl:element name="xs:element">
              <xsl:attribute name="name">Anruf</xsl:attribute>
              <xsl:attribute name="maxOccurs">unbounded</xsl:attribute>
              <xsl:element name="xs:complexType">
                <xsl:element name="xs:sequence">
                  <xsl:element name="xs:element">
                    <xsl:attribute name="name">Kunde</xsl:attribute>
                    <xsl:attribute name="type">KundeTyp</xsl:attribute>
                    <xsl:attribute name="maxOccurs">unbounded</xsl:attribute>
                  </xsl:element>
                  <xsl:element name="xs:element">
                    <xsl:attribute name="name">Tarif</xsl:attribute>
                    <xsl:attribute name="type">TarifTyp</xsl:attribute>
                  </xsl:element>
                </xsl:element>
                <xsl:element name="xs:attribute">
                  <xsl:attribute name="ref">Nr</xsl:attribute>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:element>
      <xsl:copy-of select="/xs:schema/xs:attribute"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
