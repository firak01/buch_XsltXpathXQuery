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
			
			
			//TODO GOON: Die Beispiele aus dem Buch hier anwenden
			//+++ Nun das XPath - Ausdrücke, Merke: Groß-/Kleinschreibung ist wichtig.
			
			//Finde ausgehend vom Wurzelkontoen alle Erfolg Elemten im Dokument, beachte die beiden doppelten Doppelpunkte.
			String expression01 = "child::Erfolguebersicht/child::Erfolg";
			
			
			
			String sExpression = expression01;
			
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
