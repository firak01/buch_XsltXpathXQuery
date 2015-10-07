<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="ISO-8859-1" indent="yes"/>
  <!-- Startvorlage -->
  <!--  Merke: Beispiel für komplexe oder Verknüpfung:
         <xsl:for-each select="../../objects/object[$day = weekday] | ../../objects/object[($day = 'Sa' or $day = 'So') and Rhythm = 'BlockSaSo']">
                <xsl:sort select="ObjDetail/Veranstaltung/TerBeginn" />
                <xsl:sort select="ObjDetail/Veranstaltung/TerEnde" />
          -->
  <xsl:template match="/Anrufliste">
    <html>
      <head>
        <title>Anrufliste</title>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="Anruf"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <!-- Grundvorlage für Anruf -->
  <xsl:template match="Anruf">
    <li>
      <xsl:call-template name="AnrufDaten"/>
      <br/>
      <table border="1">
        <tr>
          <th>Von</th>
          <th>Nach</th>
        </tr>
        <tr>
        	<!-- FGL: Hier habe ich die td's reingenommen -->
        	<!-- FGL: Aber dann wird sowohl der Von als auch der Nach Teil in das selbe td geschrieben. Siehe 222_02FGL02Ergebnis.html -->
        	<td>
          		<xsl:apply-templates select="Von | Nach"/>
          	</td>
        </tr>
      </table>
    </li>
  </xsl:template>
  <!-- Vorlage für Von und Nach -->
  <xsl:template match="Von | Nach">
    <xsl:call-template name="KundenDaten"/>
  </xsl:template>
  <!-- Vorlagen KundenDaten -->
  <xsl:template name="KundenDaten">
  	<!-- FGL: Hier habe ich die td's rausgenommen -->
  	<xsl:text>Von FGL modifiziert </xsl:text>
    <xsl:text>(</xsl:text>
    <xsl:value-of select="@Nr"/>
    <xsl:text>) </xsl:text>
    <xsl:value-of select="Name"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="Stadt"/>
    
  </xsl:template>
  <!-- Vorlage AnrufDaten -->
  <xsl:template name="AnrufDaten">
    <xsl:text>Nr.: </xsl:text>
    <xsl:value-of select="@Nr"/>
    <xsl:text> | Typ: </xsl:text>
    <xsl:value-of select="@Typ"/>
    <br/>
    <xsl:text>Zeit: </xsl:text>
    <xsl:value-of select="Beginn"/>
    <xsl:text>, Dauer: </xsl:text>
    <xsl:value-of select="Dauer"/>
    <xsl:text> Sek., Kosten: </xsl:text>
    <xsl:value-of select="Preis"/>
    <xsl:text> Cent.</xsl:text>
  </xsl:template>
</xsl:stylesheet>
