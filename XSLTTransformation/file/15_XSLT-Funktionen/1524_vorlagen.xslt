<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <!-- Vorlage für thead | tfoot -->
  <xsl:template match="thead | tfoot">
    <tr>
      <xsl:for-each select="row/child::*">
        <th>
          <xsl:value-of select="."/>
        </th>
      </xsl:for-each>
    </tr>
  </xsl:template>
  <!-- Vorlage für tbody -->
  <xsl:template match="tbody">
    <xsl:for-each select="row">
      <tr>
        <xsl:for-each select="child::*">
          <td>
            <xsl:value-of select="."/>
          </td>
        </xsl:for-each>
      </tr>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
