namespace ExtractAlbumsPricesPublishedBeforeYear2000UsingLINQ
{
    using System;
    using System.Linq;
    using System.Xml.Linq;

    public class Program
    {
        public static void Main()
        {
            var document = XDocument.Load("../../../01.CreateXMLCatalog/catalog.xml");

            var albumPrices =
                from album in document.Descendants("album")
                where int.Parse(album.Element("year").Value) < 2000
                select new
                {
                    Price = album.Element("price").Value
                };

            foreach (var price in albumPrices)
            {
                Console.WriteLine($"Price --> {price.Price}");
            }
        }
    }
}
