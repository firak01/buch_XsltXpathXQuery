<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage und einzelne Vorlagen -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <h1>Kundenliste</h1>
        <ul>
          <xsl:for-each select="Kundenliste/Kunde">
            <xsl:choose>
              <!-- Bereich für Geschäftskunden -->
              <xsl:when test="@Typ='g'">
                <li>
                  <xsl:text>(g) </xsl:text>
                  <xsl:value-of select="Name/Firma"/>
                  <xsl:text> | </xsl:text>
                  <xsl:value-of select="Name/Branche"/>
                </li>
              </xsl:when>
              <!-- Bereich für Privatkunden -->
              <xsl:when test="@Typ='p'">
                <li>
                  <xsl:text>(p) </xsl:text>
                  <xsl:value-of select="Name/Vorname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="Name/Nachname"/>
                </li>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
