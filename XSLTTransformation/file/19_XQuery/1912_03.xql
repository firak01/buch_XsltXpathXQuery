xquery version "1.0";

<Uebersicht>
   <Kundinnen> {
  (: Einfache Variable für alle Kunden :)
  let  $kunden := //Kunde
  (: Variable für Bindesequenz für Kundinnen :)
  for $kundinnen in $kunden
  where $kundinnen/@Anrede = 'Frau'
  order by $kundinnen/Adresse/Stadt
  return 
   <Kundin>{$kundinnen/Name/Rufname, $kundinnen/Name/Zuname, $kundinnen/Adresse/Stadt}</Kundin> 
  } </Kundinnen>
  </Uebersicht>
(: Ergebnis
<Uebersicht>
  <Kundinnen>
    <Kundin>
      <Rufname>Christa</Rufname>
      <Zuname>Mengel</Zuname>
      <Stadt>Dortmund</Stadt>
    </Kundin>
    <Kundin>
      <Rufname>Verena</Rufname>
      <Zuname>Fiegert</Zuname>
      <Stadt>Duisburg</Stadt>
    </Kundin>
  </Kundinnen>
</Uebersicht>
:)