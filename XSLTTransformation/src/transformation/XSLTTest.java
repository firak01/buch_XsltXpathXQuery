package transformation;


import javax.xml.parsers.*;

import org.w3c.dom.Document;

import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.*;

import java.io.*;


public class XSLTTest {
    static Document dokument;

    public static void main(String[] argv) {
    	String xmlPfad = "";
    	String xsltPfad = "";
    	String param = "";
    	BufferedReader br = new BufferedReader (new InputStreamReader (System.in)); 
    	
    	// Dateien einlesen
    	// Merke: Die Dateien befinden sich bei GIT - Versionsverwaltung ausserhalb des Eclipse Workspace.
    	//        Sie befinden sich in dem entsprechendem Repository
    	String repositoryPfad = "c:\\1fgl\\repo\\";
    	try{
    		
    		
    		
    		//FGL: Eingabe der Pfaddateien ist umständlich, darum hart coden oder als Argument
    		//01_Grundkkonzept: C:\\1fgl\\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\1_Grundkonzept\132_01.xml
           	//02: C:\\1fgl\\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\211_01.xml
           	
           	//03: Als Beispiel für die Verwendung vieler einzelner Vorlagen, Buch Seite 65 ff. Auf Seite 72 gibt es eine Abbildung mit den Beziehungen und Zusammenhängen in den verschiedenen Dateien.
           	//03: Auf Seite 74 steht, das es möglich ist ..."gänzlich auf die Vorlagen-Automatik zu verzichten und entweder direkte Wiederholunge mit Hilfe des for-each-Elements oder benannte Vorlagen zu verwenden.
           	//03 und 04: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\221_01.xml
    		//05: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xml //Seite 77ff "Benannte Vorlagen", Übersicht auf Seite 84
    		//06: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_02FGL.xml //Seite 86ff, Alternative zu 05 mit der "ODER-Auswahl" (hier: )  
    		//06b: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_02FGL02.xml //Seite 86ff, wie 06 aber einer einer alternativen XSD Struktur
    		//String s07xml = "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\223_01.xml"; //Seite 92ff "Vorlagen Modi"
    		//String s08xml = "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\231_01FGL.xml"; //FGL: für das Beispiel auf Seite 99ff. "Attributvorlagen"
    		String s08bxml = "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\231_01FGLb.xml"; //FGL: Mein Tryout als Erweiterung für das Beispiel, Siehe PDF Notiz auf Seite 100.     		
    		String sXml = s08bxml;
    		//++++++++++++++++++++++++++++++++++
    		String xmlPfadDefault = repositoryPfad + sXml;    		    		    		      		    		    
    		if(argv!=null){
    			if(argv.length>= 1){
    				xmlPfad=argv[0];    			    	        	
    			}
    		}
    		if(xmlPfad.equals("")){
    			System.out.println("Bitte geben Sie den XML-Pfad ein");
    			System.out.println("Bei Leerwert wird der default genommen. '" + xmlPfadDefault + "'");      
               	xmlPfad = br.readLine();
    		}
    		if(xmlPfad.equals("")){
    			xmlPfad = xmlPfadDefault;
    		}
    		
    		
    		//+++++++++++++++++++++++++++++++++++    		
    		//01_Grundkkonzept: buch_XsltXpathXQuery\\XSLTTransformation\\file\\1_Grundkonzept\132_01.xslt
        	//02: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\211_01.xsl
        	//03: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\221_01.xslt
        	
        	//04: In dem auf 03 aufbauendem Beispiel wird die Anzahl der Templates auf das nötigste reduziert (Seite 74ff)
        	//04: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\221_02.xslt
    		//05: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xslt
    		//06: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_02.xslt //XSLT-Datei mit ODER (hier: von | nach) Verwendung, Ziel ist es das gleiche Template für zwei gleichartige Strukturen zu nutzen.
    		//06b: buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_02FGL02.xslt //von mir modifizierte Version, ich habe die td's aus dem Kundendaten Template in das Anrufdaten Template verlagert. Mal sehen was passiert.    		
    		//String s07xslt =  "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\223_01.xslt"; //Buch Seite 91ff, "Vorlagen-Modi"
    		//String s08xslt = "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\231_01.xslt";//Buch Seite 99ff, zum Thema Attributwertvorlagen
    		String s08bxslt = "buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\231_01FGLb.xslt";//Mein Tryout als Erweiterung um Alias, Siehe PDF Bemerkung auf Seite 100 des Buchs  		
    		String sXslt = s08bxslt;
    		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    		String xsltPfadDefault = repositoryPfad + sXslt;
    		if(argv!=null){
    			if(argv.length>= 2){            //!!!!
    				xsltPfad=argv[1];    			    	        	
    			}
    		}
    		if(xsltPfad.equals("")){
        		System.out.println("Bitte geben Sie den XSLT-Pfad ein");
        		System.out.println("Bei Leerwert wird der default genommen. '" + xsltPfadDefault + "'");        		
            	xsltPfad = br.readLine();                			              	               
    		}
    		if(xsltPfad.equals("")){
    			xsltPfad = xsltPfadDefault;
    		}
    	
            //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   		        	
        	System.out.println("Bitte geben Sie den Parameterwert ein");        	       
        	param = br.readLine();        	
        	}
        	catch (IOException e) { 
        		e.printStackTrace();
        	}finally{
             	if(br!= null)
					try {
						br.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block						
						e.printStackTrace();
					}
        	}
    	
    	
    		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        	// Transformation aufrufen
    		System.out.println("###############################################");
   	 		System.out.println("Aufruf der Transformation mit folgenden Werten:");
   	 		System.out.println("Pfad zum Repository als Basisverzeichnis: " + repositoryPfad);
   	 		System.out.println("xmlPfad: " + xmlPfad);
   	 		System.out.println("xsltPfad: " + xsltPfad);
        	if (!xmlPfad.isEmpty() && !xsltPfad.isEmpty() && param.isEmpty()){        	 
        		transformation(xmlPfad, xsltPfad);
        	}
        	else if (!xmlPfad.isEmpty() && !xsltPfad.isEmpty() && !param.isEmpty()) {
        		System.out.println("param: " + param);
        		transformationMitParam(xmlPfad, xsltPfad, param);
        	}
    }
    
    private static void transformation (String xmlPfad, String xsltPfad){
        DocumentBuilderFactory fabrik = DocumentBuilderFactory.newInstance();
        try {
        	// Dateien
            File xmlDatei = new File(xmlPfad);
            File xsltDatei = new File(xsltPfad);
            // Eingabedaten einlesen
            DocumentBuilder xmlDOM = fabrik.newDocumentBuilder();
            dokument = xmlDOM.parse(xmlDatei);
            // XSLT-Transformator erstellen
            TransformerFactory tFabrik = TransformerFactory.newInstance();
            StreamSource xsltQuelle = new StreamSource(xsltDatei);
            Transformer transformator = tFabrik.newTransformer(xsltQuelle);
            // Umwandlung durchführen
            DOMSource quelle = new DOMSource(dokument);
            StreamResult ergebnis = new StreamResult(System.out);
            transformator.transform(quelle, ergebnis);
        } catch (TransformerConfigurationException e) {
            System.out.println("\n Transformer Factory-Fehler: ");
            System.out.println(e.getMessage());
        } catch (TransformerException e) {
            System.out.println("\n Fehler bei Transformation: ");
            System.out.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void transformationMitParam (String xmlPfad, String xsltPfad, String param){
        DocumentBuilderFactory fabrik = DocumentBuilderFactory.newInstance();
        try {
        	// Dateien
            File xmlDatei = new File(xmlPfad);
            File xsltDatei = new File(xsltPfad);
            // Eingabedaten einlesen
            DocumentBuilder xmlDOM = fabrik.newDocumentBuilder();
            dokument = xmlDOM.parse(xmlDatei);
            // XSLT-Transformator erstellen
            TransformerFactory tFabrik = TransformerFactory.newInstance();
            StreamSource xsltQuelle = new StreamSource(xsltDatei);
            Transformer transformator = tFabrik.newTransformer(xsltQuelle);
            transformator.setParameter("Farbe", param);
            // Umwandlung durchführen
            DOMSource quelle = new DOMSource(dokument);
            StreamResult ergebnis = new StreamResult(System.out);
            transformator.transform(quelle, ergebnis);
        } catch (TransformerConfigurationException e) {
            System.out.println("\n Transformer Factory-Fehler: ");
            System.out.println(e.getMessage());
        } catch (TransformerException e) {
            System.out.println("\n Fehler bei Transformation: ");
            System.out.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
