xquery version "1.0";
(: Namensraum :)
declare namespace rf="http://www.ruhrfon.biz";
(: Prozessoranweisung :)
let $target := "xml-stylesheet",
     $content := "type=""text/xsl"" href=""211_01.xsl""" 
return 
 processing-instruction {$target} {$content},
 (: Kommentar :)
 comment { text{"Kundenübersicht"} },
 (: Element mit Namensraum :)
document  {
 element rf:Kundenliste {
 for $kunden in //Kunde return 
  element Kunde {
   attribute  Nr {  $kunden/@Nr },
   attribute Anrede { $kunden/@Anrede},
   element Name {
     (: Elemente kopieren :)
     $kunden/Name/Rufname,
     $kunden/Name/Zuname
   } } } }
(: Ergebnis
<?xml-stylesheet type="text/xsl" href="211_01.xsl"?>
<!--Kundenübersicht-->
<rf:Kundenliste xmlns:rf="http://www.ruhrfon.biz">
  <Kunde Nr="235" Anrede="Frau">
    <Name>
      <Rufname>Verena</Rufname>
      <Zuname>Fiegert</Zuname>
    </Name>
  </Kunde>
</Kundenliste>
:)