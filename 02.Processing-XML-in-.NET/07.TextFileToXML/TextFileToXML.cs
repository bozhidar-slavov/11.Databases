namespace TextFileToXML
{
    using System;
    using System.IO;
    using System.Xml.Linq;

    public class TextFileToXML
    {
        public static void Main()
        {
            var person = new Person();

            using (StreamReader reader = new StreamReader("../../person-data.txt"))
            {
                person.Name = reader.ReadLine();
                person.City = reader.ReadLine();
                person.PhoneNumber = reader.ReadLine();
            }

            XElement personElement = new XElement("person",
                new XElement("name", person.Name),
                new XElement("city", person.City),
                new XElement("phone-number", person.PhoneNumber));

            personElement.Save("../../person-dataXML.xml");
            Console.WriteLine("Data from text file transfered into XML!");
        }
    }
}
