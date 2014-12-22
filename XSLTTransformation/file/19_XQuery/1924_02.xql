xquery version "1.0";
<Erfolg-Liste>
 {
   for $quartal1 in /Erfolguebersicht/Erfolg[@Monat  >= 1 and @Monat <= 3],
         $quartal3 in /Erfolguebersicht/Erfolg[@Monat  >= 7 and @Monat <= 9]
   let  $zuwachs1 := $quartal1/Neukunden div $quartal1/Gesamt,
         $zuwachs2 := $quartal3/Neukunden div $quartal3/Gesamt,
         $zuwachsVergleich := $zuwachs2 div $zuwachs1
   where $quartal1/@Stadt = 'Essen, Ruhr'  and  $quartal3/@Stadt = 'Essen, Ruhr' 
   return
      <Erfolg Stadt="{$quartal1/@Stadt}" Monat1="{$quartal1/@Monat}" Monat2="{$quartal3/@Monat}">
        <Zuwachs>{round-half-to-even($zuwachsVergleich, 2)*100}%</Zuwachs>
      </Erfolg>
  }
</Erfolg-Liste>
(: Ergebnis
<Erfolg-Liste>
  <Erfolg Stadt="Essen, Ruhr" Monat1="1" Monat2="7">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat1="1" Monat2="8">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat1="1" Monat2="9">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat1="3" Monat2="7">
    <Zuwachs>52%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat1="3" Monat2="8">
    <Zuwachs>30%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat1="3" Monat2="9">
    <Zuwachs>31%</Zuwachs>
  </Erfolg>
</Erfolg-Liste>
:)