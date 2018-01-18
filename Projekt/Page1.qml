import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

Page1Form {
    potwiedz_edycje.onClicked: {                                            //po kliknięci Potwierdz program sprawdza która wartość za co odpowiada i odpowiednio zapisuje je w automatGlobal;
        var x=automatGlobal.currentX, y=automatGlobal.currentY;             //numer wiersza i kolumny klikniętej komórki;

        automatGlobal.map[x][y].actuallR = parseInt(index_czerwony.text)-1; //zapisanie aktualnych indeksów;
        automatGlobal.map[x][y].actuallG = parseInt(index_zielony.text)-1;
        automatGlobal.map[x][y].actuallB = parseInt(index_niebieski.text)-1;
        automatGlobal.map[x][y].actuallText = parseInt(index_tekst.text)-1;
        automatGlobal.map[x][y].actuallFrame = parseInt(index_obramowanie.text)-1;

        //zmienne odpowiadają za numer wartości odpowiedzialnej za daną rzecz w automacie; R - kolor czerwony; G - kolor zielony; B - kolor niebiesk; Text - wyświetlany tekst; Frame - obramowanie; Next - wartość bez funkcji;
        var R = automatGlobal.map[x][y].actuallR,G = automatGlobal.map[x][y].actuallG,B = automatGlobal.map[x][y].actuallB,Text = automatGlobal.map[x][y].actuallText,Frame = automatGlobal.map[x][y].actuallFrame, Next = parseInt(index_bez_funkcji.text)-1;
        if(wart_czerw.length!=0 && automatGlobal.map[x][y].countOfValues>=parseInt(index_czerwony.text))//zmiana wartości w automatGlobal;
            automatGlobal.map[x][y].values[R]=parseFloat(wart_czerw.text);
        if(wart_ziel.length!=0 && automatGlobal.map[x][y].countOfValues>=parseInt(index_zielony.text))
            automatGlobal.map[x][y].values[G]=parseFloat(wart_ziel.text);
        if(wart_nieb.length!=0 && automatGlobal.map[x][y].countOfValues>=parseInt(index_niebieski.text))
            automatGlobal.map[x][y].values[B]=parseFloat(wart_nieb.text);
        if(automatGlobal.map[x][y].countOfValues>=parseInt(index_obramowanie.text))
        {
            if(switch1.checked)
                automatGlobal.map[x][y].values[Frame]=1.0;
            else
                automatGlobal.map[x][y].values[Frame]=0.0;
        }
        if(wart_tekst.length!=0 && automatGlobal.map[x][y].countOfValues>=parseInt(index_tekst.text))
            automatGlobal.map[x][y].values[Text]=wart_tekst.text;
        if(wart_chose.length!=0 && automatGlobal.map[x][y].countOfValues>=parseInt(index_bez_funkcji.text))
            automatGlobal.map[x][y].values[Next]=parseFloat(wart_chose.text);
        swipeView.decrementCurrentIndex();
    }

    aktualizuj.onClicked:{
        var x=automatGlobal.currentX, y=automatGlobal.currentY;             //numer wiersza i kolumny klikniętej komórki;
        //zmienne odpowiadają za numer wartości odpowiedzialnej za daną rzecz w automacie; R - kolor czerwony; G - kolor zielony; B - kolor niebiesk; Text - wyświetlany tekst; Frame - obramowanie; Next - wartość bez funkcji;
        var R = parseInt(index_czerwony.text)-1,G = parseInt(index_zielony.text)-1,B = parseInt(index_niebieski.text)-1,Text = parseInt(index_tekst.text)-1,Frame = parseInt(index_obramowanie.text)-1, Next = parseInt(index_bez_funkcji.text)-1;
        wart_czerw.text=automatGlobal.map[x][y].values[R];                  //aktualizacja wyświetlanych wartości klikniętej komórki na trzeciej stronie;
        wart_ziel.text=automatGlobal.map[x][y].values[G];
        wart_nieb.text=automatGlobal.map[x][y].values[B];
        wart_tekst.text=automatGlobal.map[x][y].values[Text];
        if(automatGlobal.map[x][y].values[Frame]==0)
            switch1.checked=false;
        else
            switch1.checked=true;
        if(automatGlobal.map[x][y].countOfValues>=parseInt(index_bez_funkcji.text))
            wart_chose.text=automatGlobal.map[x][y].values[Next];
    }
}
