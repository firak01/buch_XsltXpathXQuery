xquery version "1.0";
document {
element simplelists  {
  let $chapters := //chapter[1],
       $i1 :=  ($chapters//para)[1],
       $i2 :=  ($chapters//para)[2]
  for $c in $chapters/section/child::* 
  where $c >> $i1 and $c << $i2 except $c//node()
  return 
   element {local-name($c)}  {$c/child::*}
 }
}

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