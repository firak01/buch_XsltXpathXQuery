<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" exclude-result-prefixes="fn xdt xs">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Globale Parameter -->
  <xsl:param name="Wurzel"/>
  <!-- Startvorlage -->
  <xsl:template match="/xs:schema/xs:element[parent::xs:schema]">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="version">2.0</xsl:attribute>
      <xsl:namespace name="fn">http://www.w3.org/2005/02/xpath-functions</xsl:namespace>
      <xsl:namespace name="xdt">http://www.w3.org/2005/02/xpath-datatypes</xsl:namespace>
      <xsl:namespace name="xs">http://www.w3.org/2001/XMLSchema</xsl:namespace>
      <xsl:element name="xsl:output">
        <xsl:attribute name="method">html</xsl:attribute>
        <xsl:attribute name="version">1.0</xsl:attribute>
        <xsl:attribute name="encoding">UTF-8</xsl:attribute>
        <xsl:attribute name="indent">yes</xsl:attribute>
      </xsl:element>
      <xsl:comment>Startvorlage</xsl:comment>
      <xsl:element name="xsl:template">
        <xsl:attribute name="match"><xsl:value-of select="('/', $Wurzel)"/></xsl:attribute>
        <html>
          <head>
            <title>
              <xsl:element name="xsl:value-of">
                <xsl:attribute name="select">local-name(/*)</xsl:attribute>
              </xsl:element>
            </title>
          </head>
          <body>
            <xsl:for-each select="//xs:element[count(ancestor::xs:element)=1]">
              <ul>
                <xsl:element name="xsl:for-each">
                  <xsl:attribute name="select"><xsl:value-of select="//xs:element[@name=$Wurzel]/descendant::xs:element[1]/@name"/></xsl:attribute>
                  <li>
                    <xsl:for-each select="descendant::xs:element | descendant::xs:attribute">
                      <xsl:variable name="Name" select="@name"/>
                      <xsl:element name="xsl:value-of">
                        <xsl:attribute name="select">(local-name(<xsl:if test="local-name(.)='attribute'">@</xsl:if><xsl:value-of select="$Name"/>),': ', <xsl:if test="local-name(.)='attribute'">@</xsl:if><xsl:value-of select="$Name"/>, ' ')</xsl:attribute>
                      </xsl:element>
                    </xsl:for-each>
                  </li>
                </xsl:element>
              </ul>
            </xsl:for-each>
          </body>
        </html>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
