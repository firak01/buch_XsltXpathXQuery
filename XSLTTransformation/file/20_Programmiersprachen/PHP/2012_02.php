<?php
// Dateien
$xslt_datei = 'transformation.xslt';
$xml_datei = 'daten.xml';
// Zielvariable
$html;
// Ausführen des Prozessors
$xsl = new XSLTProcessor();
$xsl->importStyleSheet(DOMDocument::load($xslt_datei));
// Parameter setzen
$xsl->setParameter('', 'Farbe', 'blue');
$html = $xsl->transformToXML(DOMDocument::load($xml_datei));
// Ausgabe
echo $html;
// Parameter löschen
$xsl->removeParameter('', 'Farbe');
$html = $xsl->transformToXML(DOMDocument::load($xml_datei));
// Ausgabe
echo $html;
?> 