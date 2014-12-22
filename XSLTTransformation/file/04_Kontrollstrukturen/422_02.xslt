<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <!-- Bereich für Geschäftskunden -->
        <h1>Geschäftskunden</h1>
        <ul>
          <xsl:for-each select="Kundenliste/Kunde[@Typ='g']">
            <xsl:apply-templates select="Name"/>
          </xsl:for-each>
        </ul>
        <!-- Bereich für Privatkunden -->
        <h1>Privatkunden</h1>
        <ul>
          <xsl:for-each select="Kundenliste/Kunde[@Typ='p']">
            <xsl:apply-templates select="Name"/>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Namensausgabe-->
  <xsl:template match="Name">
    <li>
      <xsl:value-of select="Nachname | Firma"/>
      <br/>
      <xsl:value-of select="Vorname | Branche"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
