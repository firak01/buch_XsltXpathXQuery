<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Globale Parameter -->
  <xsl:param name="k-datei" required="yes" as="xs:string"/>
  <xsl:param name="p-datei" required="yes" as="xs:string"/>
  <!-- Globale Variablen -->
  <xsl:variable name="kundendaten" select="document(concat($k-datei,'.xml'))/Kunde"/>
  <xsl:variable name="postendaten" select="document(concat($p-datei,'.xml'))/Postenliste"/>
  <!-- Startvorlage -->
  <xsl:template match="/Rechnung">
    <html>
      <head>
        <title>Übersicht</title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="($kundendaten/Name/Vorname, $kundendaten/Name/Nachname)"/>
        </h1>
        <ul>
          <xsl:for-each select="$postendaten/Posten">
            <li>
              <xsl:value-of select="(Tarif, Einzeln, 'Euro')" separator=" "/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
