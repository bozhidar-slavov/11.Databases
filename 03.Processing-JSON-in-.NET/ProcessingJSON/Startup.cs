namespace ProcessingJSON
{
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;

    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Net;
    using System.Text;
    using System.Xml.Linq;

    public class Startup
    {
        public static void Main()
        {
            Console.OutputEncoding = Encoding.UTF8;
            string telerikYoutubeRSSFeed = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";
            string fileToSave = "../../telerik-rss.xml";

            string rssXMLFeed = DownloadRSS(telerikYoutubeRSSFeed, fileToSave);

            string rssJSONFeed = ParseXMLToJSON(rssXMLFeed);

            var videoTitles = GetAllVideoTitlesFromJSON(rssJSONFeed);

            PrintVideoTitles(videoTitles);

            var videos = GetAllVideosFromJSON(rssJSONFeed);

            var htmlPage = GenerateHtml(videos);
            File.WriteAllText("../../videos.html", htmlPage, Encoding.UTF8);

        }

        private static string GenerateHtml(IEnumerable<Video> items)
        {
            var sb = new StringBuilder();
            sb.AppendLine("<!DOCTYPE html><html><body><ul>");

            foreach (var item in items)
            {
                sb.AppendFormat("<li style=\"list-style-type:none;\"><a href=\"{0}\"><strong>{1}</strong></a></li>", item.Link.Href, item.Title);
                sb.AppendFormat("<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/{0}?autoplay=1\"></iframe>", item.Id);
            }

            sb.AppendLine("</ul></body></html>");

            return sb.ToString();
        }

        private static IEnumerable<Video> GetAllVideosFromJSON(string json)
        {
            var jsonObject = JObject.Parse(json);
            var extractedVideos = jsonObject["feed"]["entry"].Select(v => JsonConvert.DeserializeObject<Video>(v.ToString()));

            return extractedVideos;
        }

        private static void PrintVideoTitles(IEnumerable<JToken> titles)
        {
            foreach (var title in titles)
            {
                Console.WriteLine(title);
            }
        }

        private static IEnumerable<JToken> GetAllVideoTitlesFromJSON(string json)
        {
            var jsonObject = JObject.Parse(json);
            var titles = jsonObject["feed"]["entry"].Select(e => e["title"]);

            return titles;
        }

        private static string DownloadRSS(string url, string xmlFile)
        {
            var webClient = new WebClient();
            webClient.DownloadFile(url, xmlFile);

            return xmlFile;
        }

        private static string ParseXMLToJSON(string rssXMLFile)
        {
            var document = XDocument.Load(rssXMLFile);
            string jsonFromXML = JsonConvert.SerializeXNode(document, Formatting.Indented);

            return jsonFromXML;
        }
    }
}
