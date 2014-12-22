xquery version "1.0";

declare function local:toc($chapter-or-section as element()) as element()*
{
    for $chapter in $chapter-or-section/chapter | $chapter-or-section/section
    return
      <title> 
         { $chapter/@* ,
           $chapter/title,
          $chapter/subtitle,
           local:toc($chapter) }                 
     </title>
};

element toc {
     for $c in book return local:toc($c)  
}

(: Ergebnis
<toc>
  <title id="1">
    <title>RuhrFon GmbH - Eine Welle des Erfolgs</title>
    <title id="1">
      <title>Von Anfang an eine Erfolgsgeschichte</title>
      <subtitle>Die RuhrFon GmbH im Aufwind</subtitle>
    </title>
    <title id="2">
      <title>Gute Umsatzzahlen und niedrige Preise</title>
      <subtitle>Beeindruckende Leistung in einem umkämpften Markt</subtitle>
    </title>
  </title>
  <title id="2">
    <title>RuhrFon GmbH - von Telefonfreunden gegründet</title>
    <title id="1">
      <title>Anton Ebenhof</title>
      <subtitle>Marketing</subtitle>
    </title>
    <title id="2">
      <title>Friedrich Bullock</title>
      <subtitle>Technik</subtitle>
    </title>
  </title>
  <title id="3">
    <title>RuhrFon GmbH - Ihr regionaler Telefonanbieter</title>
    <title id="1">
      <title>Vorteile</title>
      <subtitle>Günstige Tarife für Sie und Ihre Freunde</subtitle>
    </title>
    <title id="2">
      <title>Kunde werden</title>
      <subtitle>Günstige Tarife für Sie und Ihre Freunde</subtitle>
    </title>
    <title id="3">
      <title>Kontakt</title>
      <subtitle>Nehmen Sie Kontakt mit uns auf</subtitle>
    </title>
  </title>
</toc>
:)