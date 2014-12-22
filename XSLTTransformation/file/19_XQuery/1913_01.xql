xquery version "1.0";
(: Elementname als Bezeichner vorgegeben :)
element Kundenliste {
 for $kunden in //Kunde return 
  element Kunde {
   (: Attributtname als Bezeichner vorgegeben, Wert mit XPath abgerufen :)
   attribute  Nr {  $kunden/@Nr },
   attribute Anrede { $kunden/@Anrede},
   (: Wert direkt als Textknoten vorgegeben :)
   attribute Typ { text{"p"} },
   element Name {
     (: Name aus Ausdruck ermittelt :)
     element {local-name($kunden/Name/Rufname)} { $kunden/Name/Rufname/text() },
     (: Wert mit text() :)
     element Zuname { $kunden/Name/Zuname/text() }
   } } }
(: Ergebnis
<Kundenliste>
  <Kunde Nr="235" Anrede="Frau" Typ="p">
    <Name>
      <Rufname>Verena</Rufname>
      <Zuname>Fiegert</Zuname>
    </Name>
  </Kunde>
  </Kundenliste>
:)