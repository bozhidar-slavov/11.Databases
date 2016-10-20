namespace ExtractAlbumsPricesPublishedBeforeYear2000WithXPath
{
    using System;
    using System.Xml;

    public class ExtractAlbumsPrices
    {
        public static void Main()
        {
            var document = new XmlDocument();
            document.Load("../../../01.CreateXMLCatalog/catalog.xml");
            var rootNode = document.DocumentElement;
            string xPathYearQuery = "/catalog/album[year<2000]/price";
            XmlNodeList albumPrices = rootNode.SelectNodes(xPathYearQuery);

            foreach (XmlNode price in albumPrices)
            {
                Console.WriteLine($"Price --> {price.InnerText}");
            }
        }
    }
}
