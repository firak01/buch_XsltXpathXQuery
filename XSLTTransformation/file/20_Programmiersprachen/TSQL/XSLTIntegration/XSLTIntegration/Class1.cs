using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Data;

namespace Transform
{
    public class MyTransformingClass
    {
        public static string Transform(string inputXML, string inputXSLT)
        {
            System.Xml.XmlReader xslt = System.Xml.XmlReader.Create(new System.IO.StringReader(inputXSLT));
            XslCompiledTransform proc = new XslCompiledTransform();
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(inputXML);
            proc.Load(xslt);
            XsltArgumentList args = new XsltArgumentList();
            StringBuilder res = new StringBuilder();
            XmlWriter writer = XmlWriter.Create(res, new XmlWriterSettings());
            proc.Transform(xml, args, writer);
            return res.ToString();
        }
    }
}

