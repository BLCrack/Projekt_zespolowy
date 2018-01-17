function scriptNextStep(automat){	//gra o zycie
    var licznik_sasiadow = 0;
    var map_next = automat.map;
    var w, l, r;
    for (var i = 0; i<automat.size; i++){
        for (var j = 0; j<automat.size; j++){
            if(i-1<0)       //ustalenie sąsiedztwa na 8
                w=automat.size-1;
            else
                w=i-1;

            if(j-1<0)
                l=automat.size-1;
            else
                l=j-1;

            if(j+1==automat.size)
                r=0;
            else
                r=j+1;

            licznik_sasiadow=0;
            if (automat.map[w][l].values[0] == 0.0) licznik_sasiadow++;		//gorne
            if (automat.map[w][j].values[0] == 0.0) licznik_sasiadow++;
            if (automat.map[w][r].values[0] == 0.0) licznik_sasiadow++;

            if (automat.map[i][l].values[0] == 0.0) licznik_sasiadow++;		//srodkowe
            if (automat.map[i][r].values[0] == 0.0) licznik_sasiadow++;

            if(i+1==automat.size)
                w=0;
            else
                w=i+1;

            if (automat.map[w][l].values[0] == 0.0) licznik_sasiadow++;		//dolne
            if (automat.map[w][j].values[0] == 0.0) licznik_sasiadow++;
            if (automat.map[w][r].values[0] == 0.0) licznik_sasiadow++;

            if (automat.map[i][j].values[0] == 255.0){
                if (licznik_sasiadow == 3){
                    //żywa
                    map_next[i][j].values[0]=0.0
                    map_next[i][j].values[1]=0.0
                    map_next[i][j].values[2]=0.0
                    map_next[i][j].values[3]=0.0
                }
            }
            else{
                if (licznik_sasiadow != 2 && licznik_sasiadow != 3){
                    //nie żywa
                    map_next[i][j].values[0]=255.0
                    map_next[i][j].values[1]=255.0
                    map_next[i][j].values[2]=255.0
                    map_next[i][j].values[3]=1.0
                }
            }
        }
    }
    return map_next;
}

function include(path){Qt.include(path)}        //funkcja pozwalająca dodać nowy skrypt
