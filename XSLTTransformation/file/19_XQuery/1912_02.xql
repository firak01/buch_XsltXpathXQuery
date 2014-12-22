xquery version "1.0";
(: Erwarte Namentyp und erzeuge Zeichenkette:)
declare function local:summary($Kundenname as element(Name, NameType)) 
   as xs:string {
   return
      {string-join($Kundenname/Rufname, $Kundenname/Zuname}
};

<Uebersicht>{
  (: Einfache Variable :)
  let  $kunde := //Kunde
  (: Variable für Bindesequenz:)
  for $staedte in distinct-values(//Stadt)
  return
    <Stadt>
      <Name>{ $staedte } </Name>
      <Anzahl>{ count($kunde/Adresse/Stadt = $staedte) } </Anzahl>
    </Stadt>
 }</Uebersicht>
(: Ergebnis
<Uebersicht>
  <Stadt>
    <Name>Duisburg</Name>
    <Anzahl>1</Anzahl>
  </Stadt>
  <Stadt>
    <Name>Dortmund</Name>
    <Anzahl>1</Anzahl>
  </Stadt>
  <Stadt>
    <Name>Essen, Ruhr</Name>
    <Anzahl>1</Anzahl>
  </Stadt>
</Uebersicht>
:)