<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- FGL 20150121: Diese Vorlage kann auch über das Öffnen der 231_03FGL.xml Datei im Browser geladen werden.
  <!-- FGL 20150121: Bei folgender Fehlermeldung hat man die templates mit call-template name="..." eingebunden, dabei kann man keinen mode angeben.
                     ERROR:  'file:/c:/1fgl/repo/buch_XsltXpathXQuery/XSLTTransformation/.......  : Vorlage "Uebersicht" bereits in diesem Stylesheet definiert.' -->
  
  
  <!-- Startvorlage -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Telefontarife</title>
      </head>
      <body>
        <ul>
        <!-- FGL mit call-template kann man keinen mode übergeben, also verwende apply-templates -->
		<!-- <xsl:call-template name="Uebersicht" /> -->
		<xsl:apply-templates select="Tarifliste/Tarif" mode="Uebersicht"/>
          
        </ul>
        <p>
         <xsl:apply-templates select="Tarifliste/Tarif" mode="Details"/>
        </p>
      </body>
    </html>
  </xsl:template>
  <!-- Vorlage für Tarif (Uebersicht mit Verweis) -->
  <xsl:template match="Tarif" mode="Uebersicht">
    <li>
      <a href="tarif.php?name={Name}">
        <xsl:value-of select="Name"/>
      </a>
    </li>
  </xsl:template>
  <!-- Vorlage für Tarif (Liste) -->
  <!-- FGL 20150121: Ich bekomme es nicht hin die Texte darzustellen usw. es werden einfach immer alle Werte ausgegeben. Warum? -->
  <!--               Auch wenn ich alles rausnehme! -->
  <!--               Lösung: Ich hatte template name="Tarif" hier stehen und nicht template match="Tarif"!!! -->
  <!--   			<xsl:template name="Tarif" mode="Details"> -->
  <xsl:template match="Tarif" mode="Details">
     <p>
   		<b>
        <xsl:value-of select="Name"/>
        <xsl:text> Nr: </xsl:text>
        <!-- FGL: Schönes Beispiel mit @ auf das Attribut eines Tags zuzugreifen -->
        <xsl:value-of select="Name/@Nr"/>
      </b>
      <br/>
      <xsl:text>Gueltigkeit: </xsl:text>
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
    <xsl:text>&#xa;</xsl:text><!-- soll einen Zeilenumbruch machen, was es auch tut -->
  </xsl:template>
</xsl:stylesheet>
