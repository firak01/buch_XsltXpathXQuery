<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <h1>Geschäftskunden</h1>
        <ul>
          <xsl:apply-templates select="Kundenliste/Kunde[@Typ='g']"/>
        </ul>
        <h1>Privatkunden</h1>
        <ul>
          <xsl:apply-templates select="Kundenliste/Kunde[@Typ='p']"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Kunde">
    <li>
      <xsl:value-of select="Name/Nachname | Name/Firma"/>
      <br/>
      <xsl:value-of select="Name/Vorname | Name/Branche"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
