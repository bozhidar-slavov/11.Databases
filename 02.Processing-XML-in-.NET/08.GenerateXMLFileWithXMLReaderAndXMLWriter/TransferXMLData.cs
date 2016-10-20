namespace GenerateXMLFileWithXMLReaderAndXMLWriter
{
    using System.Text;
    using System.Xml;

    public class TransferXML
    {
        public static void Main()
        {
            string fileName = "../../album.xml";
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            using (XmlTextWriter writer = new XmlTextWriter(fileName, encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("catalog");

                using (XmlReader reader = XmlReader.Create("../../../01.CreateXMLCatalog/catalog.xml"))
                {
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element && (reader.Name == "name"))
                        {
                            writer.WriteStartElement("album");
                            writer.WriteElementString("name", reader.ReadElementString());
                        }
                        else if (reader.NodeType == XmlNodeType.Element && (reader.Name == "artist"))
                        {
                            writer.WriteElementString("artist", reader.ReadElementString());
                            writer.WriteEndElement();
                        }
                    }
                }

                writer.WriteEndDocument();
            }
        }
    }
}
