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
    	try{
    		
    		//FGL: Eingabe der Pfaddateien ist umständlich, darum hart coden oder als Argument
    		//01_Grundkkonzept: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\1_Grundkonzept\132_01.xml
           	//02: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\02_Vorlagen\211_01.xml
           	
           	//03: Als Beispiel für die Verwendung vieler einzelner Vorlagen, Buch Seite 65 ff. Auf Seite 72 gibt es eine Abbildung mit den Beziehungen und Zusammenhängen in den verschiedenen Dateien.
           	//03: Auf Seite 74 steht, das es möglich ist ..."gänzlich auf die Vorlagen-Automatik zu verzichten und entweder direkte Wiederholunge mit Hilfe des for-each-Elements oder benannte Vorlagen zu verwenden.
           	//03 und 04: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\02_Vorlagen\221_01.xml
    		//05: C:\\1fgl\\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xml
    		String xmlPfadDefault = "C:\\1fgl\\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xml";    		    		    		      		    		    
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
    		    		
    		//01_Grundkkonzept: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\1_Grundkonzept\132_01.xslt
        	//02: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\02_Vorlagen\211_01.xsl
        	//03: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\02_Vorlagen\221_01.xslt
        	
        	//04: In dem auf 03 aufbauendem Beispiel wird die Anzahl der Templates auf das nötigste reduziert (Seite 74ff)
        	//04: C:\1fgl\ws-fgl\buch_XsltXpathXQuery\XSLTTransformation\file\02_Vorlagen\221_02.xslt
    		//05: C:\\1fgl\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xslt
    		String xsltPfadDefault = "C:\\1fgl\\ws-fgl\\buch_XsltXpathXQuery\\XSLTTransformation\\file\\02_Vorlagen\\222_01.xslt";
    		if(argv!=null){
    			if(argv.length>= 2){            //!!!!
    				xsltPfad=argv[1];    			    	        	
    			}
    		}
    		if(xsltPfad.equals("")){
        		System.out.println("Bitte geben Sie den XSLT-Pfad ein");
        		System.out.println("Bei Leerwert wird der default genommen. '" + xsltPfadDefault + "'");        		
            	xsltPfad = br.readLine();            
    			System.out.println("Bitte geben Sie den XML-Pfad ein");              	               	
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
            // Umwandlung durchf�hren
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
            // Umwandlung durchf�hren
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
