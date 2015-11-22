using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountryDatabaseCreator
{
    class Program
    {
        static void Main(string[] args)
        {

            var y = SpotifyAPI.getArtistsTopSongsByCountry(SpotifyAPI.getArtistID("Justin Bieber"), "US");
        }
    }
}
