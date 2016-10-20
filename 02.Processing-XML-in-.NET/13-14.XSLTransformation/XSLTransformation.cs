namespace XSLTransformation
{
    using System.Xml.Xsl;

    public class XSLTransformation
    {
        static void Main()
        {
            var xslt = new XslCompiledTransform();
            xslt.Load("../../catalog.xslt");
            xslt.Transform("../../../01.CreateXMLCatalog/catalog.xml", "../../catalog.html");
        }
    }
}
