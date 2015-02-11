package xpath;

import java.io.File;

public class XPathTest_322_01FGL {

	public static void main(String[] args) {
		
		try{
			//Eclipse Workspace
			File f = new File("");
		    String sPathEclipse = f.getAbsolutePath();
		    System.out.println("Eclipse absolut path: " + sPathEclipse);
	        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
	        String sBaseDirectory = sPathEclipse + File.separator + "file" +  File.separator + "03_XPath";
	                 
			//... Ab hier wie bei der Paremterübergabe im fertig gepackten .jar - File...
			if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
			System.out.println("Directory to process: '" + sBaseDirectory + "'");
			
			String sFileName = "322_01.xml";
			System.out.println("File to process: '" + sFileName + "'");
			
			
			//############Die Beispiele aus dem Buch hier anwenden (Seite 128)
			//TODO: Der XPathParser müsste sich von einem Ergebnis zu einem anderen Bewegen können,
			//      so dass ein Array von Expressions ausgwertet werden kann. Dabei sind nachfolgende Strings im Array diejenigen, die auf das vorherige Ergebnis angewendet werden.
			//      Hintergrund: Momentan funktionieren von den Beispielen nur diejenigen, die vom Wurzelelement ausgehen!
			
			
			//+++ Nun die XPath - Ausdrücke, Merke: Groß-/Kleinschreibung ist wichtig.
			
			//A) Kind Achse
			
			//Finde ausgehend vom Wurzelknoten alle Erfolg Elemten im Dokument, beachte die beiden doppelten Doppelpunkte.
			String expression01 = "child::Erfolguebersicht/child::Erfolg";
			
			//Findet ausgehend vom Wurzelelement alle Gesamt-Elemente im Dokument in Dokumentenrichtung
			String expression02 = "child::Erfolguebersicht/child::Erfolg/child::Gesamt";
			
			//Findet ausgehend vom Wurzelelement Gesamt-, Neukunde- und Erfolg-Elemente in Dokumentenrichtung
			String expression03 = "child::Erfolguebersicht/child::Erfolg/following::*";
			
			//B) Geschwister Achse
			
			//findet ausgehend von einem Erfolg-Element die nachfolgenden Erfolg Geschwister 
			String expression04 = "following-sibling::Erfolg"; //Als einzelner String liefert es kein sinnvolles Ergebnis. TODO: Klasse entsprechend anpassen. 
			
			//findet ausgehend von einem Erfolg-Element die vorhergehenden Erfolg Geschwister
			String expression05 = "preceding-sibling::Erfolg";
			
			//findet ausgehend von einem Erfolg-Element das Erfolguebersicht-Element
			String expression06 = "parent::*";
			
			//findet ausgend von einem Gesamt-Element sein Erfolg-Element als Elternelement und das Erfolguebersicht-Element
			String expression07 = "ancestor::*";
			
			//C) Nachfahren Achse
			
			//findet ausgehend von einem Erfolg-Element die Elemente Gesamt und Neukunden in Dokumentenrichtung
			String expression08 = "descendant::*";
			
			//findet ausgehend vom Wurzelelement alle Erfolg-Elemente und ihre Kinder
			String expression09 = "descendant::*";
			
			//findet ausgehend vom Wurzelelement alle Gesamt-Elemente
			String expression10 = "descendant::Gesamt";
			
			
			//D) Attribut Achse
			
			//findet ausgehend vom Wurzelelement alle Stadt Attribute
			String expression11 = "descendant::Erfolg/attribute::Stadt";
			
			//findet ausgehend vom Wurzelelement alle Attribute in Erfolg
			String expression12 = "descendant::Erfolg/attribute::*";
			
			//findet ausgehend von einem Erfolg-element das Attribut Monat in seinem Elternelement
			String expression13 = "parent::Erfolg/attribute::Monat";
			
			//findet ausgehend von einem Erfolg-Element seine Attribute in Dokumentrichtung
			String expression14 = "attribute::*";
	
			
			//######################################
			//Prädikate, stehen in eckigen Klammern, dienen als "Feinsteuerung" der knotenlokalisierung
			//           und können ebenfalls wieder Pfade und Funktionen enthalten.
			//Siehe Buch Seiten 133ff
			//zu Abkürzungen, die hier verwendet werden, siehe buch Seite 129
			
			//Welche Erfolg-Elemente haben mehr als 10 Neukunden?
			String expression15 = "//Erfolg[Neukunden>10]"; //Merke: // ist eine Abkürzung für /descendant-or-self::node()
			
			//Welche Städte in welchem Monat haben mehr als 10 Neukunden?
			String expression16 = "//Erfolg[Neukunden>10]/attribute::*";
			
			//Todo GOON: Weitere Beispiele aus dem Buch Seite 135ff
			
			String sExpression = expression16;
			
			//+++++++++++++++++++++++++++++++++++++++++++++++++++
			String[] argsForParser = new String[3];
			argsForParser[0] = sBaseDirectory;
			argsForParser[1] = sFileName;
			argsForParser[2] = sExpression;
			
			MyXPathParserFGL objParserFGL = new MyXPathParserFGL();		
			objParserFGL.startIt(argsForParser);
			
			
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}

		}

}
