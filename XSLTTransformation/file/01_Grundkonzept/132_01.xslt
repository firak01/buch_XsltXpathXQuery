<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="/Mitarbeiterliste">
    <html>
      <head>
        <title>
          <xsl:value-of select="local-name(/*)"/>
        </title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="local-name(/*)"/>
        </h1>
        <ul>
          <xsl:for-each select="Mitarbeiter">
            <li>
              <xsl:apply-templates select="Name"/>
              <br/>
              <xsl:text>Funktion: </xsl:text>
              <xsl:value-of select="Funktion"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Element Name -->
  <xsl:template match="Name">
    <xsl:value-of select="@Anrede"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Vorname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Nachname"/>
  </xsl:template>
</xsl:stylesheet>
