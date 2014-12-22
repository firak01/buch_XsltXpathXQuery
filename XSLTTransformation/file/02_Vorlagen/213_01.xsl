<?xml version="1.0" encoding="UTF-8"?>
<!-- FGL 20141128: Beispiel für eine Verarbeitung (Siehe Seite 60 im Buch)
                   Im template wird per XPath direkt auf den Gruss-Knoten zugegriffen
                   Das so erstellte Template wird dann in einem nächsten Schritt 1:1 an die Stelle Gruß gesetzt -->
<!-- Man startet das Beispiel über die Datei 210_01.xml im Browser.
     Ruft man im Browser den Quellcode auf, wird nur die XML-Datei angezeigt. 
     Um aber zu verdeutlichen, das per XSLT der angegebe HTML-Code 'errechnet' wird, habe ich die "rosabox" eingebaut. -->                   
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:apply-templates select="Text/Gruss"/>
        </title>
        
        <style type="text/css">
body { background-color:#E0E0E0; font-weight:bold; font-family:Arial; font-size:120%; }
.rosabox { background-color:#FFDDDD; padding:6px; margin:0px; }
.rosa { background-color:#FFDDDD; }
.gelbbox { background-color:#FFFF66; padding:6px; margin:0px; }
.gelb { background-color:#FFFF66; }
</style>
        
      </head>
      <body>
      	<p class="rosabox"><span style="font-family:'Times New Roman',Times,serif font-size:200%">
        <xsl:apply-templates select="Text/Gruss"/>
        </span></p>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="Gruss">
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
