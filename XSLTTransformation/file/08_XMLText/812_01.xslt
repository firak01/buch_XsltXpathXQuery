<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1"/>
  <xsl:param name="action" select="'erfassung.php'"/>
  <xsl:param name="method" select="'post'"/>
  <!-- Startvorlage -->
  <xsl:template match="/xs:schema">
    <html>
      <head>
        <title>Erfassung <xsl:value-of select="/xs:schema/xs:element/@name"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates select="xs:element[parent::xs:schema]"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Elemente der obersten Ebene -->
  <xsl:template match="xs:element[parent::xs:schema]">
    <h1>
      <xsl:value-of select="@name"/>
    </h1>
    <form>
      <xsl:attribute name="action"><xsl:value-of select="$action"/></xsl:attribute>
      <xsl:attribute name="method"><xsl:value-of select="$method"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <table>
        <xsl:variable name="aktuellesElement" select="@name"/>
        <xsl:for-each select="//xs:element[ancestor::xs:element/@name=$aktuellesElement]">
          <tr>
            <th>
              <xsl:value-of select="@name"/>
            </th>
            <td>
              <xsl:choose>
                <xsl:when test="count(xs:simpleType/xs:restriction/xs:enumeration) &gt;=1">
                  <xsl:call-template name="SelectListe"/>
                  <xsl:apply-templates select="@type | xs:simpleType/xs:restriction/@base"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="InputFeld"/>
                  <xsl:apply-templates select="@type | xs:simpleType/xs:restriction/@base"/>
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </xsl:for-each>
        <tr>
          <th> </th>
          <td>
            <input type="submit" value="Senden" name="Senden"/>
            <input type="reset" value="Löschen"/>
          </td>
        </tr>
      </table>
    </form>
  </xsl:template>
  <!-- Select-Liste -->
  <xsl:template name="SelectListe">
    <select>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <xsl:for-each select="xs:simpleType/xs:restriction/xs:enumeration">
        <option>
          <xsl:attribute name="value"><xsl:value-of select="@value"/></xsl:attribute>
          <xsl:value-of select="@value"/>
        </option>
      </xsl:for-each>
    </select>
  </xsl:template>
  <!-- Input-Feld -->
  <xsl:template name="InputFeld">
    <input>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <xsl:attribute name="type"><xsl:text>text</xsl:text></xsl:attribute>
      <xsl:attribute name="size"><xsl:value-of select="descendant::xs:maxLength/@value"/><xsl:value-of select="descendant::xs:totalDigits/@value"/></xsl:attribute>
    </input>
  </xsl:template>
  <!-- Datentyperkennung -->
  <xsl:template match="@type | xs:simpleType/xs:restriction/@base">
    <xsl:call-template name="Datentyp">
      <xsl:with-param name="xsWert" select="."/>
    </xsl:call-template>
  </xsl:template>
  <!-- Längenbeschränkung -->
  <xsl:template match="xs:maxLength/@value">
    <xsl:value-of select="@value"/>
  </xsl:template>
  <!-- Vorlage Datentypzuordnung / Verstecktes Feld-->
  <xsl:template name="Datentyp">
    <xsl:param name="xsWert"/>
    <input type="hidden">
      <xsl:attribute name="name"><xsl:value-of select="ancestor::xs:element[1]/@name"/><xsl:text>_TYP</xsl:text></xsl:attribute>
      <xsl:attribute name="value"><xsl:choose><xsl:when test="$xsWert = 'xs:decimal'"><xsl:text>NUMBER</xsl:text></xsl:when><xsl:when test="$xsWert = 'xs:string'"><xsl:text>VARCHAR2</xsl:text></xsl:when><xsl:when test="$xsWert = 'xs:dateTime'"><xsl:text>DATE</xsl:text></xsl:when></xsl:choose></xsl:attribute>
    </input>
  </xsl:template>
</xsl:stylesheet>
