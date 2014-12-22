<?php
// Dateien
$xslt_datei = 'transformation_php.xslt';
$xml_datei = 'daten.xml';
// Zielvariable
$html;
// Ausführen des Prozessors
$xsl = new XSLTProcessor();
$xsl->registerPhpFunctions();
$xsl->importStyleSheet(DOMDocument::load($xslt_datei));
$html = $xsl->transformToXML(DOMDocument::load($xml_datei));
// Ausgabe
echo $html;
?> 