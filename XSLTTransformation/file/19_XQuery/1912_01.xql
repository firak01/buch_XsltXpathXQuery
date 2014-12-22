xquery version "1.0";
<Kundenliste>{
 (: Variable für Bindesequenz:)
  for $kunde in //Kunde
  (: Filtern zur Aufnahme in Bindesequenz :)
  where $kunde/@Anrede = "Frau" and $kunde/Adresse/Stadt = "Duisburg"
  (: Definition der Rückgabe :)
  return
    <Kunde Anrede="{ $kunde/@Anrede }">
     { $kunde/Name }
    </Kunde>
 }</Kundenliste>
(: Ergebnis
<Kundenliste>
  <Kunde Anrede="Frau">
    <Name>
      <Rufname>Verena</Rufname>
      <Zuname>Fiegert</Zuname>
    </Name>
  </Kunde>
</Kundenliste>
:)