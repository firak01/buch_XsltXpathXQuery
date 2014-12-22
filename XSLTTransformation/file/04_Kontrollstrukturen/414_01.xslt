<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <h1>Kundenliste</h1>
        <ul>
          <!-- Start des Ping-Pong-Spiels -->
          <xsl:apply-templates select="Kundenliste/Kunde"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!--  Vorlage für Kunde -->
  <xsl:template match="Kunde">
    <li>
      <xsl:value-of select="if (@Typ = 'g')
              then ('(g) ', Name/Firma, ' | ', Name/Branche)
              else ('(p) ', Name/Vorname, ' ', Name/Nachname)"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
