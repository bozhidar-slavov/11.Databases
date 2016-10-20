namespace RemoveAlbumsWithPriceGreaterThanTwentyWithDOMParser
{
    using System;
    using System.Xml;

    public class RemoveAlbums
    {
        public static void Main()
        {
            var document = new XmlDocument();
            document.Load("../../../01.CreateXMLCatalog/catalog.xml");
            var rootNode = document.DocumentElement;

            foreach (XmlNode node in rootNode.SelectNodes("album"))
            {
                var currentAlbumPrice = double.Parse(node["price"].InnerText);
                if (currentAlbumPrice > 20)
                {
                    rootNode.RemoveChild(node);
                }
            }

            document.Save("../../catalogAfterPriceChanges.xml");
            Console.WriteLine("Catalog changes saved!");
        }
    }
}
