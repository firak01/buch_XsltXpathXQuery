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
          <xsl:apply-templates select="Tarifliste/Tarif"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Tarif -->
  <xsl:template match="Tarif">
    <li>
      <a href="tarif.php?name={Name}">
        <xsl:value-of select="Name"/>
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>
