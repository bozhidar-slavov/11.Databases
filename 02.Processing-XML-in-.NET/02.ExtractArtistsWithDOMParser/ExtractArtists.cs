namespace ExtractArtistsWithDOMParser
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
            var uniqueArtistInfo = new Dictionary<string, int>();

            foreach (XmlNode node in rootNode.ChildNodes)
            {
                var currentArtist = node["artist"].InnerText;

                if (uniqueArtistInfo.ContainsKey(currentArtist))
                {
                    uniqueArtistInfo[currentArtist]++;
                }
                else
                {
                    uniqueArtistInfo.Add(node["artist"].InnerText, 1);
                }
            }

            foreach (var artist in uniqueArtistInfo)
            {
                Console.WriteLine($"Artist '{artist.Key}' has {artist.Value} number of albums!");
            }
        }
    }
}
