xquery version "1.0";
<Kundenliste>{
  for $kunde in //Kunde
  return
   if ($kunde/@Anrede = "Herr")
   then 
    <Kunde>
     { $kunde/Name/child::* }
    </Kunde>
    else 
     <Kundin>
     { $kunde/Name/child::* }
    </Kundin>   
    
 }</Kundenliste>
(: Ergebnis
<Kundenliste>
  <Kundin>
    <Rufname>Verena</Rufname>
    <Zuname>Fiegert</Zuname>
  </Kundin>
  <Kundin>
    <Rufname>Christa</Rufname>
    <Zuname>Mengel</Zuname>
  </Kundin>
  <Kunde>
    <Rufname>Claus-Peter</Rufname>
    <Zuname>Dreske</Zuname>
  </Kunde>
  <Kunde>
    <Rufname>Volker</Rufname>
    <Zuname>Filskowski</Zuname>
  </Kunde>
</Kundenliste>
:)