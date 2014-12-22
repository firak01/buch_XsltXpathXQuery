<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/Umsatzliste">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <table border="1">
          <tr>
            <th>Rechnung immer vorhanden?</th>
            <th>Rechnung mind. 1x irgendwo vorhanden?</th>
            <th>Rechnungen immer über 2 Euro?</th>
            <th>Einige Rechnungen mit MwSt. über 20 Euro?</th>
          </tr>
          <tr>
            <td>
              <xsl:value-of select="every $r in //Rechnungsliste satisfies $r/Rechnung"/>
            </td>
            <td>
              <xsl:value-of select="some $r in //Rechnungsliste satisfies $r/Rechnung"/>
            </td>
            <td>
              <xsl:value-of select="every $t in //Tarif[Rechnungsliste/exists(child::*)] satisfies (sum($t//Rechnung/@R_Summe) &gt; 2)"/>
            </td>
            <td>
              <xsl:value-of select="some $t in //Tarif, $m in  (1.16) satisfies (sum($t//Rechnung/@R_Summe) * $m &gt; 20)"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
