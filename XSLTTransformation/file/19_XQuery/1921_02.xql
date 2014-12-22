xquery version "1.0";

declare function local:section-summary($chapter-or-section as element()*)
                            as element()* {
  for $s in $chapter-or-section
  return
    <section>
       { $s/@* }
       { $s/title }       
       <simplelistcount>         
         { count($s/simplelist) }
       </simplelistcount>                
       { local:section-summary($s/section) }                      
    </section>
};
<toc>   {
    for $s in book/chapter | book/section
    return local:section-summary($s)
  } </toc>

(: Ergebnis
<toc>
  <section id="1">
    <title>RuhrFon GmbH - Eine Welle des Erfolgs</title>
    <simplelistcount>0</simplelistcount>
    <section id="1">
      <title>Von Anfang an eine Erfolgsgeschichte</title>
      <simplelistcount>2</simplelistcount>
    </section>
    <section id="2">
      <title>Gute Umsatzzahlen und niedrige Preise</title>
      <simplelistcount>1</simplelistcount>
    </section>
  </section>
  <section id="2">
    <title>RuhrFon GmbH - von Telefonfreunden gegründet</title>
    <simplelistcount>0</simplelistcount>
    <section id="1">
      <title>Anton Ebenhof</title>
      <simplelistcount>0</simplelistcount>
    </section>
    <section id="2">
      <title>Friedrich Bullock</title>
      <simplelistcount>0</simplelistcount>
    </section>
  </section>
  <section id="3">
    <title>RuhrFon GmbH - Ihr regionaler Telefonanbieter</title>
    <simplelistcount>0</simplelistcount>
    <section id="1">
      <title>Vorteile</title>
      <simplelistcount>0</simplelistcount>
    </section>
    <section id="2">
      <title>Kunde werden</title>
      <simplelistcount>0</simplelistcount>
    </section>
    <section id="3">
      <title>Kontakt</title>
      <simplelistcount>0</simplelistcount>
    </section>
  </section>
</toc>

:)