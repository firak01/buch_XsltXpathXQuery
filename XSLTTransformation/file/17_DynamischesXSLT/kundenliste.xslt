<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <!-- Vorlage für Kundenliste -->
  <xsl:template match="/Kundenliste">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <xsl:apply-templates select="Kunde"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
