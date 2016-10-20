namespace ExtractArtistsWithXPath
{
    using System;
    using System.Collections.Generic;
    using System.Xml;

    public class ExtractArtists
    {
        public static void Main()
        {
            var document = new XmlDocument();
            document.Load("../../../01.CreateXMLCatalog/catalog.xml");
            var rootNode = document.DocumentElement;
            string xPathQuery = "/catalog/album/artist";

            XmlNodeList albums = rootNode.SelectNodes(xPathQuery);
            var uniqueArtistsInfo = new Dictionary<string, int>();

            foreach (XmlNode node in albums)
            {
                string currentArtist = node.InnerText;

                if (uniqueArtistsInfo.ContainsKey(currentArtist))
                {
                    uniqueArtistsInfo[currentArtist]++;
                }
                else
                {
                    uniqueArtistsInfo.Add(currentArtist, 1);
                }
            }

            foreach (var artist in uniqueArtistsInfo)
            {
                Console.WriteLine($"Artist '{artist.Key}' has {artist.Value} number of albums!");
            }
        }
    }
}
