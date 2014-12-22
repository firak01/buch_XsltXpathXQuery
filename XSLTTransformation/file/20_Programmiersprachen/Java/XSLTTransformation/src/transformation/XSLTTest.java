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
    	// Dateien einlesen
    	try{
    		System.out.println("Bitte geben Sie den XML-Pfad ein");
           	BufferedReader br = new BufferedReader (new InputStreamReader (System.in));
        	xmlPfad = br.readLine();
        	System.out.println("Bitte geben Sie den XSLT-Pfad ein");
        	xsltPfad = br.readLine();
        	System.out.println("Bitte geben Sie den Parameterwert ein");
        	param = br.readLine();
        	}
        	catch (IOException e) { 
        		e.printStackTrace();
        	}
        	// Transformation aufrufen
        	if (!xmlPfad.isEmpty() && !xsltPfad.isEmpty() && param.isEmpty()){
        	 transformation(xmlPfad, xsltPfad);
        	}
        	else if (!xmlPfad.isEmpty() && !xsltPfad.isEmpty() && !param.isEmpty()) {
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
