namespace ExtractSongTitlesWithXDocument
{
    using System;
    using System.Linq;
    using System.Xml.Linq;

    public class ExtractSongTitles
    {
        public static void Main()
        {
            var document = XDocument.Load("../../../01.CreateXMLCatalog/catalog.xml");

            var songTitles =
                from song in document.Descendants("song")
                select new
                {
                    Title = song.Element("title").Value,
                };

            foreach (var song in songTitles)
            {
                Console.WriteLine($"Song --> '{song.Title}'");
            }
        }
    }
}
