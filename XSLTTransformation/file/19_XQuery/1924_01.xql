xquery version "1.0";
<Erfolg-Liste>
 {
   for $erfolge in /Erfolguebersicht/Erfolg[@Monat  >= 6]
   let $zuwachs := $erfolge/Neukunden div $erfolge/Gesamt
   return
      <Erfolg Stadt="{$erfolge/@Stadt}" Monat="{$erfolge/@Monat}">
        <Zuwachs>{round-half-to-even($zuwachs, 2)*100}</Zuwachs>
      </Erfolg>
  }
</Erfolg-Liste>
(: Ergebnis 
<Erfolg-Liste>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="1">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Gelsenkirchen" Monat="1">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="1">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="1">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="1">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="2">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>4%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>16%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="2">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>48%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>28%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>33%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>43%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>24%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>25%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>23%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="2">
    <Zuwachs>61%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>17%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>37%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>7%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>26%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>34%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>5%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>19%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>19%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>18%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>12%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="2">
    <Zuwachs>48%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>40%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>53%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>114%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>67%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>80%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>104%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>25%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>57%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>59%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>55%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>18%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>36%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>89%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>62%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>41%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Bochum" Monat="3">
    <Zuwachs>146%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>60%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>80%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>171%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>100%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>32%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>120%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>157%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>23%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>38%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>86%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>89%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>83%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>27%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>55%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>133%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>94%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>62%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Duisburg" Monat="3">
    <Zuwachs>220%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>27%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>57%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>33%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>11%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>40%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>52%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>12%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>30%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>28%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>18%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>44%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>31%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Essen, Ruhr" Monat="3">
    <Zuwachs>73%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>27%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>57%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>33%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>11%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>40%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>52%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>12%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>30%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>28%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>18%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>44%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>31%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Herne, Westf" Monat="3">
    <Zuwachs>73%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>20%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>43%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>25%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>30%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>39%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>6%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>22%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>7%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>14%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>33%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>23%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>15%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Dortmund" Monat="3">
    <Zuwachs>55%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>28%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>59%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>34%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>11%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>41%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>54%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>8%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>13%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>29%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>31%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>28%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>9%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>19%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>46%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>32%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>21%</Zuwachs>
  </Erfolg>
  <Erfolg Stadt="Düsseldorf" Monat="3">
    <Zuwachs>75%</Zuwachs>
  </Erfolg>
</Erfolg-Liste>

:)