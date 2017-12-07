function scriptNextStep(map)	//gra o zycie
{
    var licznik_sasiadow = 0;
    var map_next = map;
    for (var i = 0; i<size; i++)
    {
        for (var j = 0; j<size; j++)
        {

            if (map[i - 1][j - 1].isLive == true) licznik_sasiadow++;		//gorne
            if (map[i - 1][j].isLive == true) licznik_sasiadow++;
            if (map[i - 1][j + 1].isLive == true) licznik_sasiadow++;

            if (map[i][j - 1].isLive == true) licznik_sasiadow++;		//srodkowe
            if (map[i][j + 1].isLive == true) licznik_sasiadow++;

            if (map[i + 1][j - 1].isLive == true) licznik_sasiadow++;		//dolne
            if (map[i + 1][j].isLive == true) licznik_sasiadow++;
            if (map[i + 1][j + 1].isLive == true) licznik_sasiadow++;

            if (map[i][j].isLive == false)
            {
                if (licznik_sasiadow == 3) map_next[i][j].isLive = true;
            }
            else
            {
                if (licznik_sasiadow != 2 && licznik_sasiadow != 3) map_next[i][j].isLive = false;
            }
        }
    }
    return map_next;
}
