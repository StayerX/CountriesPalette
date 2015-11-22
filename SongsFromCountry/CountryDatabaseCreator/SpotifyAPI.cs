using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace CountryDatabaseCreator
{
    class SpotifyAPI
    {
        public static String getArtistID(String artistName)
        {
            
            using (var httpClient = new HttpClient())
            {
                String json = new WebClient().DownloadString(String.Format("https://api.spotify.com/v1/search?q={0}&type=artist",artistName));
                var ID = parseJson(json, "id");
                return ID[0];
                
                
            }
            
        }
        public static List<String> getArtistsTopSongsByCountry(String artistID, String country)
        {
            //country must be alpha2String
            String json = new WebClient().DownloadString(String.Format("https://api.spotify.com/v1/artists/{0}/top-tracks?country={1}", artistID, country));
            var songs = parseJson(json, "name");
            var types = parseJson(json, "type");
            List<String> finalSongs = new List<string>();
            for (int i = 0; i < types.Count; i++)
            {
                if(types[i] == "track")
                {
                    finalSongs.Add(songs[i]);
                }
            }
            return finalSongs;
        }

        public static List<int> AllIndexesOf(string str, string value)
        {
            if (String.IsNullOrEmpty(value))
                throw new ArgumentException("the string to find may not be empty", "value");
            List<int> indexes = new List<int>();
            for (int index = 0; ; index += value.Length)
            {
                index = str.IndexOf(value, index);
                if (index == -1)
                    return indexes;
                indexes.Add(index);
            }
        }

        private static List<String> parseJson(string json, String objectToParseFor)
        {
            List<String> allVals = new List<string>();
            var allIndexes = AllIndexesOf(json,"\"" + objectToParseFor + "\"" );
            foreach (var item in allIndexes)
            {
                String piece = json.Substring(item);
                int id = piece.IndexOf(',');
                piece= piece.Substring(0, id);
                id = piece.IndexOf(':');
                piece = piece.Substring(id);
                piece = piece.Remove(0, 3);
                piece = piece.Remove(piece.Count() - 1);
                allVals.Add(piece);
            }

            return allVals;
        }
    }
  
}
