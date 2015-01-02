<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <!-- FGL: Buch Seite 92ff, über das xsl:apply-template wird das XML Dokument mehrmals von vorne ausgewertet.
            der mode bewirkt, das jedesmal ein anderes Template verwendet wird.
            Das erste Mal ein Template, das auf der gleichen html-Ausgabeseite für eine "Übersicht" sorgt,
            Das zweite Mal ein Template, das die "Detailtabelle" erstellt -->  
  <xsl:template match="/">
    <html>
      <head>
        <title>Telefontarife</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Tarifliste/Tarif" mode="Uebersicht"/>
        </ul>
        <xsl:apply-templates select="Tarifliste/Tarif" mode="Details"/>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Tarif (Uebersicht) -->
  <xsl:template match="Tarif" mode="Uebersicht">
    <li>
      <xsl:value-of select="Name"/>
    </li>
  </xsl:template>
  <!-- Vorlage für Tarif (Details) -->
  <xsl:template match="Tarif" mode="Details">
    <p>
      <b>
        <xsl:value-of select="Name"/>
        <xsl:text> Nr: </xsl:text>
        <!-- FGL: Schönes Beispiel mit @ auf das Attribut eines Tags zuzugreifen -->
        <xsl:value-of select="Name/@Nr"/>
      </b>
      <br/>
      <xsl:text>Gültigkeit: </xsl:text>
      <!-- FGL: Seite 96, hier sind anders als im Beispiel vorher lange XPath Ausdrücke notwendig. -->
      <!--      Das liegt meiner Meinung daran, dass der XSLT Prozessor eben nicht mehrmals gestartet wird,
                sondern nur einmal gestartet wird und die Pfade nun von einer beliebigen Stelle aus gelten sollen,
                unabhängig von der Stelle an der der XSLT-Prozessor gerade ist. -->
      <xsl:value-of select="Gueltigkeit/Datum/Von"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="Gueltigkeit/Datum/Bis"/>
      <xsl:text> | Dauer: </xsl:text>
      <xsl:value-of select="Gueltigkeit/Uhrzeit/Von"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="Gueltigkeit/Uhrzeit/Bis"/>
    </p>
  </xsl:template>
</xsl:stylesheet>
