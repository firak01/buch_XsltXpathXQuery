<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Telefontarife</title>
      </head>
      <body>
        <ul>
          <xsl:call-template name="Uebersicht" />
          
        </ul>
        
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Tarif (Verweis) -->
  <xsl:template name="Uebersicht" mode="Verweis">
    <li>
      <a href="tarif.php?name={Name}">
        <xsl:value-of select="Name"/>
      </a>
    </li>
  </xsl:template>
  <!-- Vorlage für Tarif (Liste) -->
  <xsl:template name="Uebersicht" mode="Liste">
    <li>
      <xsl:value-of select="Name"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
