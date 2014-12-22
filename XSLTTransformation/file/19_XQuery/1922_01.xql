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
  <title>RuhrFon GmbH - von Telefonfreunden gegr�ndet</title>
  <section id="1">
    <title>Anton Ebenhof</title>
    <subtitle>Marketing</subtitle>
    <graphic fileref="anton_ebenhof.jpg" align="center"/>
    <para>Mit Anton Ebenhof (Jahrgang 1978) hat die RuhrFon GmbH einen �beraus kreativen Marketing-Direktor gefunden. Seine Einf�lle �berraschen immer wieder Mitarbeiter und Kunden und zeigen jedes Mal aufs Neue, dass auch - oder gerade - unkonventionelles Marketing ma�geblich zum Erfolg eines Unternehmens beitr�gt.</para>
    <para>
      <question>Was haben Sie studiert?</question>
      <answer>Wirtschaftswissenschaft in Wuppertal und Paris</answer>
    </para>
    <para>
      <question>Wie stehen Sie zum Telefonieren?</question>
      <answer>Man darf nat�rlich nicht glauben, dass ich den ganzen Tag telefoniere, obwohl nat�rlich mein Denken sehr mit dem Telefon verbunden ist. Privat erledige ich nat�rlich sehr viel mit dem Telefon, allerdings sch�tze ich auch ein gem�tliches Beisammensein, das man freilich per Telefon vereinbart hat.</answer>
    </para>
    <para>
      <question>Ihre besten Ratschl�ge f�r ein gutes Telefonat?</question>
      <answer>Man muss differenzieren, ob es ein gesch�ftsliches oder privates Telefongespr�ch werden soll, wobei nat�rlich auch in einem gesch�ftliche Telefonat allerhand Privates erz�hlt werden kann. Ich halte es pers�nlich so, dass ich mir vorher sehr genau �berlege, was ich sagen oder erreichen m�chte. Manchmal muss es ja auch im privaten Bereich schon mal rasch gehen. Wenn der Kino-Film um 20 Uhr beginnt, und ich erst um 19 Uhr Begleitung suche, dann sollte ich mir Fragen nach dem Wohlfbefinden vielleicht kurz sparen und sofort Tacheles reden. Ansonsten kann man sicherlich auch einfach nur mal so jemanden anrufen, aber wenn ein Ziel zu erreichen ist, dann ist es ratsam, vorher �berhaupt zu finden, wo das Gespr�ch hinf�hren soll.</answer>
    </para>
    <para>
      <question>Gibt es Expansionspl�ne au�erhalb des Ruhrgebiets?</question>
      <answer>Wie Sie sich vorstellen k�nnen, werden wir nat�rlich insbesondere von den Randbereichen des Ruhrgebiets immer wieder angefragt, ob angrenzende Gebiete bald angeschlossen sind. Wie das technisch funktioniert, kann ich nicht sagen, aber zurzeit sind wir ein Ruhrgebietsunternehmen. Allerdings - warum sollten wir uns selbst beschr�nken? Wenn wir die n�tige Infrastruktur haben und das Interesse besteht, dann gibt es uns sicherlich bald in ganz NRW.</answer>
    </para>
    <para>
      <question>Pers�nliche W�nsche f�r dieses Gesch�ftsjahr?</question>
      <answer>Mehr Kunden, mehr Umsatz, mehr Zufriedenheit auf allen Seiten.</answer>
    </para>
  </section>
  <section id="2">
    <title>Friedrich Bullock</title>
    <subtitle>Technik</subtitle>
    <graphic fileref="friedrich_bullock.jpg" align="center"/>
    <para>Mit Friedrich Bullock (Jahrgang 1971) hat die RuhrFon GmbH einen Technik-Experten, der die Telefondienstleistungen f�r die Kunden und die interne Technik v�llig sicher im Griff hat und f�r ein reibungsloses Funktionieren des Unternehmens sorgt.</para>
    <para>
      <question>Was haben Sie studiert?</question>
      <answer>Elektro-Technik in Bochum und Dortmund</answer>
    </para>
    <para>
      <question>Wie stehen Sie zum Telefonieren?</question>
      <answer>Ich bin nicht den ganzen Tag am H�rer, doch sind es sicherlich einige Stunden t�glich. Da habe ich dann auch verschiedene technische Hilfsmittel und sehr sch�ne Kopfh�rer. Die sind nichts f�r den Gebrauch in der Fu�g�ngerzone, aber sehr gesundheitsvertr�glich und vor allen Dingen f�r den internen Gebrauch. Wenn ich mal nicht telefonieren, dann rede ich allerdings auch mit Leuten - allerdings von Gesicht zu Gesicht.</answer>
    </para>
    <para>
      <question>Ihre besten Ratschl�ge f�r ein gutes Telefonat?</question>
      <answer>Zeit nehmen, immer Zeit nehmen. Wenn man ganz schnell etwas erreichen m�chte, dann ist es vielleicht sogar am einfachsten, kurz ein Stockwerk nach oben oder unten zu gehen und es direkt anzuprechen. Wenn das nicht geht, dann am Telefon nicht dr�ngen, sondern lieber erst einmal nachfragen, ob man gerade wichtige Entscheidungen treffen kann. Dann ist das Interesse und die Neugierde da - und ich habe ein offenes Ohr gefunden.</answer>
    </para>
    <para>
      <question>Gibt es Expansionspl�ne au�erhalb des Ruhrgebiets?</question>
      <answer>Interesse von angrenzenden Gebieten ist verst�ndlicherweise da. Auch vorhandene Kunden m�chten gerne nach au�en telefonieren. Es sind einige technische und juristische H�rden zu nehmen, aber wir sind soweit gekommen, da werden auch noch weiter kommen.</answer>
    </para>
    <para>
      <question>Pers�nliche W�nsche f�r dieses Gesch�ftsjahr?</question>
      <answer>F�r mich pers�nlich ist wichtig, dass wir bei steigender Kundenzahl die erreichte technische Qualit�t auf allen Gebieten halten k�nnen.</answer>
    </para>
  </section>
</interviews>

:)