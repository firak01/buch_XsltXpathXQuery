xquery version "1.0";

declare function local:precedes($a as node(), 
                                                       $b as node()) as xs:boolean 
{
    $a << $b  and empty($a//node() intersect $b)
};

declare function local:follows($a as node(), $b as node()) as xs:boolean 
{
    $a >> $b  and  empty($b//node() intersect $a)
};

<interviews>
 {
  let $chapters := //chapter
  for $c in $chapters/child::*
  where local:follows($c, ($chapters[@id = "1"]))
    and local:precedes($c, ($chapters[@id = "3"]))
  return $c
 }
</interviews> 



(: Ergebnis
<interviews>
  <title>RuhrFon GmbH - von Telefonfreunden gegründet</title>
  <section id="1">
    <title>Anton Ebenhof</title>
    <subtitle>Marketing</subtitle>
    <graphic fileref="anton_ebenhof.jpg" align="center"/>
    <para>Mit Anton Ebenhof (Jahrgang 1978) hat die RuhrFon GmbH einen überaus kreativen Marketing-Direktor gefunden. Seine Einfälle überraschen immer wieder Mitarbeiter und Kunden und zeigen jedes Mal aufs Neue, dass auch - oder gerade - unkonventionelles Marketing maßgeblich zum Erfolg eines Unternehmens beiträgt.</para>
    <para>
      <question>Was haben Sie studiert?</question>
      <answer>Wirtschaftswissenschaft in Wuppertal und Paris</answer>
    </para>
    <para>
      <question>Wie stehen Sie zum Telefonieren?</question>
      <answer>Man darf natürlich nicht glauben, dass ich den ganzen Tag telefoniere, obwohl natürlich mein Denken sehr mit dem Telefon verbunden ist. Privat erledige ich natürlich sehr viel mit dem Telefon, allerdings schätze ich auch ein gemütliches Beisammensein, das man freilich per Telefon vereinbart hat.</answer>
    </para>
    <para>
      <question>Ihre besten Ratschläge für ein gutes Telefonat?</question>
      <answer>Man muss differenzieren, ob es ein geschäftsliches oder privates Telefongespräch werden soll, wobei natürlich auch in einem geschäftliche Telefonat allerhand Privates erzählt werden kann. Ich halte es persönlich so, dass ich mir vorher sehr genau überlege, was ich sagen oder erreichen möchte. Manchmal muss es ja auch im privaten Bereich schon mal rasch gehen. Wenn der Kino-Film um 20 Uhr beginnt, und ich erst um 19 Uhr Begleitung suche, dann sollte ich mir Fragen nach dem Wohlfbefinden vielleicht kurz sparen und sofort Tacheles reden. Ansonsten kann man sicherlich auch einfach nur mal so jemanden anrufen, aber wenn ein Ziel zu erreichen ist, dann ist es ratsam, vorher überhaupt zu finden, wo das Gespräch hinführen soll.</answer>
    </para>
    <para>
      <question>Gibt es Expansionspläne außerhalb des Ruhrgebiets?</question>
      <answer>Wie Sie sich vorstellen können, werden wir natürlich insbesondere von den Randbereichen des Ruhrgebiets immer wieder angefragt, ob angrenzende Gebiete bald angeschlossen sind. Wie das technisch funktioniert, kann ich nicht sagen, aber zurzeit sind wir ein Ruhrgebietsunternehmen. Allerdings - warum sollten wir uns selbst beschränken? Wenn wir die nötige Infrastruktur haben und das Interesse besteht, dann gibt es uns sicherlich bald in ganz NRW.</answer>
    </para>
    <para>
      <question>Persönliche Wünsche für dieses Geschäftsjahr?</question>
      <answer>Mehr Kunden, mehr Umsatz, mehr Zufriedenheit auf allen Seiten.</answer>
    </para>
  </section>
  <section id="2">
    <title>Friedrich Bullock</title>
    <subtitle>Technik</subtitle>
    <graphic fileref="friedrich_bullock.jpg" align="center"/>
    <para>Mit Friedrich Bullock (Jahrgang 1971) hat die RuhrFon GmbH einen Technik-Experten, der die Telefondienstleistungen für die Kunden und die interne Technik völlig sicher im Griff hat und für ein reibungsloses Funktionieren des Unternehmens sorgt.</para>
    <para>
      <question>Was haben Sie studiert?</question>
      <answer>Elektro-Technik in Bochum und Dortmund</answer>
    </para>
    <para>
      <question>Wie stehen Sie zum Telefonieren?</question>
      <answer>Ich bin nicht den ganzen Tag am Hörer, doch sind es sicherlich einige Stunden täglich. Da habe ich dann auch verschiedene technische Hilfsmittel und sehr schöne Kopfhörer. Die sind nichts für den Gebrauch in der Fußgängerzone, aber sehr gesundheitsverträglich und vor allen Dingen für den internen Gebrauch. Wenn ich mal nicht telefonieren, dann rede ich allerdings auch mit Leuten - allerdings von Gesicht zu Gesicht.</answer>
    </para>
    <para>
      <question>Ihre besten Ratschläge für ein gutes Telefonat?</question>
      <answer>Zeit nehmen, immer Zeit nehmen. Wenn man ganz schnell etwas erreichen möchte, dann ist es vielleicht sogar am einfachsten, kurz ein Stockwerk nach oben oder unten zu gehen und es direkt anzuprechen. Wenn das nicht geht, dann am Telefon nicht drängen, sondern lieber erst einmal nachfragen, ob man gerade wichtige Entscheidungen treffen kann. Dann ist das Interesse und die Neugierde da - und ich habe ein offenes Ohr gefunden.</answer>
    </para>
    <para>
      <question>Gibt es Expansionspläne außerhalb des Ruhrgebiets?</question>
      <answer>Interesse von angrenzenden Gebieten ist verständlicherweise da. Auch vorhandene Kunden möchten gerne nach außen telefonieren. Es sind einige technische und juristische Hürden zu nehmen, aber wir sind soweit gekommen, da werden auch noch weiter kommen.</answer>
    </para>
    <para>
      <question>Persönliche Wünsche für dieses Geschäftsjahr?</question>
      <answer>Für mich persönlich ist wichtig, dass wir bei steigender Kundenzahl die erreichte technische Qualität auf allen Gebieten halten können.</answer>
    </para>
  </section>
</interviews>

:)