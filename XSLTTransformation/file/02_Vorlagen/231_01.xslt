<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
    <!-- FGL: Buch Seite 99ff, zum Thema Attributwertvorlagen.
              Mit Hilfe von geschweiften Klammern trennt man
              innerhalb der Anführungszeichen 
              die festen Testwerte des zu erzeugenden Attributs
              von einem XPath-Ausdruck, der weitere Werte liefert.
	-->  
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
  <xsl:template match="Tarif"><!-- Hier: Ausdruck in den geschweiften Klammern ist ein XPATH Ausdruck. Das muss man so machen, um es in das Attribut des Tags <a href... zu füllen.  -->
    <li>
      <a href="tarif.php?name={Name}">
        <xsl:value-of select="Name"/><!-- Hier: XSLT-Wert wird lediglich als Beschriftung des Links im Browser angezeigt. -->
      </a>
    </li>
  </xsl:template>
</xsl:stylesheet>
