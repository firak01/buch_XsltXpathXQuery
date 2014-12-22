xquery version "1.0";
declare function local:between($seq as node()*, 
                          $start as node(), 
                          $ende as node())  as item()*
{                                                                                        
  let $knoten :=
    for $n in $seq except $start//node()
    where $n >> $start and $n << $ende
    return $n
  return $knoten except $knoten//node()
};

<simplelists>
 {
  let $simplelists := //chapter[1],
      $start :=  ($simplelists//para)[1],
      $ende:=  ($simplelists//para)[2]
  return local:between($simplelists//node(), $start, $ende)
 }
</simplelists>


(: Ergebnis
<simplelists>
  <simplelist>
    <title>Geschäftstarife</title>
    <member>Extern, 2 Cent/Min</member>
    <member>Nachtschicht1, 1 Cent/Min</member>
    <member>Nachtschicht2, 1 Cent/Min</member>
    <member>Schicht1, 1 Cent/Min</member>
    <member>Schicht2, 1,5 Cent/Min</member>
  </simplelist>
  <simplelist>
    <title>Privattarife</title>
    <member>Abendessen, 1 Cent/Min</member>
    <member>Frühstück, 1 Cent/Min</member>
    <member>Mittagspause, 1,5 Cent/Min</member>
    <member>Mondschein1,  0,5 Cent/Min</member>
    <member>Mondschein2,  0,5 Cent/Min</member>
  </simplelist>
</simplelists>:)