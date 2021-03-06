﻿namespace TraverseDirectoryWithXDocument
{
    using System.IO;
    using System.Xml.Linq;

    public class TraverseDirectoryWithXDocument
    {
        public static void Main()
        {
            string directory = @"G:\IT\Projects\11.Databases\02.Processing-XML-in-.NET\09.TraverseDirectoryContentToXML";
            var rootDirectory = new DirectoryInfo(directory);

            XElement directoryInfo = new XElement("root");
            directoryInfo.Add(TraverseDirectory(rootDirectory));

            directoryInfo.Save("../../directoryInfo.xml");
        }

        private static XElement TraverseDirectory(DirectoryInfo directory)
        {
            var element = new XElement("dir", new XAttribute("path", directory.Name));
            foreach (var dir in directory.GetDirectories())
            {
                element.Add(TraverseDirectory(dir));
            }

            foreach (var file in directory.GetFiles())
            {
                element.Add(new XElement("file", new XAttribute("name", file.Name)));
            }

            return element;
        }
    }
}