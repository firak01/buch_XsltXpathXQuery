xquery version "1.0";
(: Erwarte Element Name und erzeuge Zeichenkette:)
declare function local:NameAlsZeichenkette($kundenname as element(Name)) 
   as xs:string {
   for $k in $kundenname 
   return fn:concat($k/Zuname, ', ', $k/Rufname)
};
(: Erwarte beliebiges Element und erzeuge Elemente :)
declare function local:KundeVerarbeiten($kunde ) 
   as element()* {
   for $k in $kunde
   return 
       <Name>{ local:NameAlsZeichenkette($kunde/Name) } </Name>
};
<Uebersicht>{
  for $kunde in //Kunde
  return
      local:KundeVerarbeiten($kunde )
 }</Uebersicht>
(: Ergebnis
<Uebersicht>
  <Name>Fiegert, Verena</Name>
  <Name>Mengel, Christa</Name>
  <Name>Dreske, Claus-Peter</Name>
  <Name>Filskowski, Volker</Name>
</Uebersicht>
:)