using System ;
using System.IO ;
using System.Xml ;
using System.Xml.Xsl ;
using System.Xml.XPath ;

public class XmlTransformation
{
 public static void Main(string[] args)
 {
  string XmlPfad;
  string XslPfad;
  Console.WriteLine("Bitte geben Sie den XmlPfad ein");
  XmlPfad = Console.ReadLine();
  Console.WriteLine("Bitte geben Sie den XslPfad ein");
  XslPfad = Console.ReadLine();
            Transformation(XmlPfad, XslPfad); 
  }
  
 public static void Transformation(string XmlPfad, string XslPfad)
 {
  try
     {            
      //Laden der XML Datei
      XPathDocument myXPathDoc = new XPathDocument(XmlPfad) ;
      XslCompiledTransform myXslTrans = new XslCompiledTransform();
      //Laden der Xsl Datei 
      myXslTrans.Load(XslPfad);
      //Argumente können übergeben werden
      XsltArgumentList args = new XsltArgumentList();
      args.AddParam("Farbe", "", "blue");
      //Erstellen der result.html
      XmlTextWriter myWriter = new XmlTextWriter
                               ("c:\\result.html", null);
      //Transformation der aktuellen Xml Datei
      myXslTrans.Transform(myXPathDoc, args, myWriter);        
      myWriter.Close() ;
     }
   catch(Exception e)
    {
     Console.WriteLine("Exception: {0}", e.ToString());
    }
  }
        
 public static void PrintUsage()
  {
   Console.WriteLine
   ("Usage: XmlTransformUtil.exe <xml path> <xsl path>");
  }

}
