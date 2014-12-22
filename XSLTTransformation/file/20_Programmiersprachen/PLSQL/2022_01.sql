DECLARE
 -- Verzeichnis
 dir         VARCHAR2(100) := 'C:\Ausgabe';
 -- XML-Datei (extern)
 xmlfile     VARCHAR2(100) := 'daten.xml'; 
 -- XSLT-Datei (extern)
 xslfile     VARCHAR2(100) := 'transformation.xslt';
 -- Ergebnisdatei (extern)
 resfile     VARCHAR2(100) := 'daten_plsql.html'; 
 -- Fehlerdatei (extern)
 errfile     VARCHAR2(100) := 'fehler_plsql.txt';
 
 -- Parser
 p           xmlparser.Parser; -- Parser
 xmldoc      xmldom.DOMDocument; -- DOM-Dokument
 xmldocnode  xmldom.DOMNode; -- DOM-Knoten
 proc        xslprocessor.Processor; -- XSLT-Prozessor
 ss          xslprocessor.Stylesheet; -- XSLT-Datei
 xsldoc      xmldom.DOMDocument; -- XSLT-DOM-Dokument
 docfrag     xmldom.DOMDocumentFragment; -- DOM-Fragment
 docfragnode xmldom.DOMNode; -- DOM-Fragment-Knoten
 xslelem     xmldom.DOMElement; -- DOM-Element
BEGIN
 -- Erzeuge Parser
 p := xmlparser.newParser;

 -- Eigenschaften des Parsers
 -- Fehlerdatei
 xmlparser.setErrorLog(p, dir || '/' || errfile);
 -- Leerzeichenbewahrung
 xmlparser.setPreserveWhiteSpace(p, TRUE);

 -- Transformation XML->DOM
 xmlparser.parse(p,  dir || '/' || xmlfile);

 -- DOM-Dokument erhalten
 xmldoc := xmlparser.getDocument(p);

 -- Transformation XML->HTML
 xmlparser.parse(p, dir || '/' || xslfile);

 -- DOM-Dokument von XSLT-Datei erhalten
 xsldoc := xmlparser.getDocument(p);
 -- Angabe der XSLT-Datei
 ss := xslprocessor.newStylesheet(xsldoc, dir || '/' || 
                                  xslfile);

 -- Transformation von XML mit XSLT -> HTML
 proc := xslprocessor.newProcessor;
 xslprocessor.showWarnings(proc, true);
 xslprocessor.setErrorLog(proc, dir || '/' || errfile);

 docfrag := xslprocessor.processXSL(proc, ss, xmldoc);
 docfragnode := xmldom.makeNode(docfrag);
 -- Dateierstellung
 xmldom.writeToFile(docfragnode, dir || '/' || resfile); 

 -- XML-Dateien lösen
 xmldom.freeDocument(xmldoc);
 xmldom.freeDocument(xsldoc);

 -- XSL-Datei und Prozessor entfernen
 xslprocessor.freeProcessor(proc);
 xslprocessor.freeStylesheet(ss);

 -- Parser entfernen
 xmlparser.freeParser(p);
END;
