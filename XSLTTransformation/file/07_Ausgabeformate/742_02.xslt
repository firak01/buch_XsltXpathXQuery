<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Ausgabeformate -->
  <xsl:output name="uebersicht-format" method="xhtml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//DE" encoding="ISO-8859-1"/>
  <xsl:output name="detail-format" method="xhtml" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//DE" encoding="ISO-8859-1"/>
  <xsl:template match="/">
    <!-- Frames -->
    <xsl:result-document href="frames.html" format="uebersicht-format" validation="strict">
      <html>
        <head>
          <title>
            <xsl:value-of select="local-name(/*)"/>
          </title>
        </head>
        <frameset cols="250, *">
          <frame src="inhalt.html" name="inhalt"/>
          <frame src="tarif{/Tarifliste/Tarif[1]/Name}.html" name="details"/>
        </frameset>
      </html>
    </xsl:result-document>
    <!-- Inhaltsverzeichnis -->
    <xsl:result-document href="inhalt.html" format="uebersicht-format" validation="strict">
      <html xmlns="http://www.w3.org/1999/xhtml">
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
            <xsl:for-each select="/Tarifliste/Tarif">
              <li>
                <a href="tarif{Name}.html" target="details">
                  <xsl:value-of select="Name"/>
                </a>
              </li>
            </xsl:for-each>
          </ul>
        </body>
      </html>
    </xsl:result-document>
    <!-- Detailseiten -->
    <xsl:for-each select="/Tarifliste/Tarif">
      <xsl:result-document href="tarif{Name}.html" format="detail-format" validation="strip">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <title>
              <xsl:value-of select="Name"/>
            </title>
          </head>
          <body>
            <h1>
              <xsl:value-of select="Name"/>
            </h1>
            <!-- Ausgabe von Tarifinformationen -->
            <p>
              <xsl:text>Datum: </xsl:text>
              <xsl:value-of select="Gueltigkeit/Datum/Von"/>
              <xsl:text> - </xsl:text>
              <xsl:value-of select="Gueltigkeit/Datum/Bis"/>
              <xsl:text> | Dauer: </xsl:text>
              <xsl:value-of select="Gueltigkeit/Uhrzeit/Von"/>
              <xsl:text> - </xsl:text>
              <xsl:value-of select="Gueltigkeit/Uhrzeit/Bis"/>
            </p>
            <p>Minutenpreis: <xsl:value-of select="Preis"/> Cent</p>
          </body>
        </html>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
