namespace ExtractSongTitlesWithXMLReader
{
    using System;
    using System.Xml;

    public class ExtractSongTitles
    {
        public static void Main()
        {
            using (XmlReader reader = XmlReader.Create("../../../01.CreateXMLCatalog/catalog.xml"))
            {
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element && reader.Name == "title")
                    {
                        Console.WriteLine($"Song --> '{reader.ReadElementString()}'");
                    }
                }
            }
        }
    }
}
