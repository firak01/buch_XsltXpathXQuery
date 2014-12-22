<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnungen">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <xsl:for-each select="Rechnung">
          <xsl:variable name="kundendaten" select="document(concat(Kunde/@Datei,'.xml'))/Kunde"/>
          <h1>
            <xsl:value-of select="($kundendaten/Name/Vorname, $kundendaten/Name/Nachname)"/>
          </h1>
          <xsl:variable name="postendaten" select="document(concat(Postenliste/@Datei,'.xml'))/Postenliste"/>
          <ul>
            <xsl:for-each select="$postendaten/Posten">
              <li>
                <xsl:value-of select="(Tarif, Einzeln, 'Euro')"/>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
