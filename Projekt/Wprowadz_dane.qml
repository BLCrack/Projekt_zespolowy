import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Qt.labs.platform 1.0
import Usuniecie 1.0
import "automatkomorkowy.js" as Logika

Wprowadz_daneForm {
//poniżej znajduje się funkcja która jest odpowiedzialna za dynamiczne rysowanie komórek. Parametr który pobiera to rozmiar automatGlobal;
//gdy podamy coś innego niż liczbę funkcja nic nie robi;
        function draw(a) {
            var x=0,y=0, size=0, font=12;                                   //zmienne odpowiedzialne za położenie i rozmiar trzcionki;

            if(pincha.children!=null)                                       //czyszczenie poprzedniej wersji automatu;
                for(var k=pincha.children.length; k>0;k--)
                    pincha.children[k-1].destroy();
            opiskomorki.text=""
            edytuj.visible=false
            iter.text="Iteracja nr.: "+iteracja;

            if(Screen.width<Screen.height)                                  //tutaj ustawiam rozmiar komórki;
                size=Screen.width/a
            else{
                size =Screen.height;
                size=(size-140)/a;
            }

            tlo.y=size*a+1;                                                 //ustawienie położenia i wysokości okna odpowiedzialnego za wyświetlanie wartości komórki;
            tlo.height=Screen.height-size*a;

            if(a>14&&a<23)                                                  //ustawinie trzcionki względem rozmiaru automatu;
                font-=2;
            else{
                if(a>22 && a<31)
                    font-=4;
                else{
                    if(a>30&&a<39)
                        font-=6;
                    else{
                        if(a>38&&a<47)
                            font-=8;
                        else{
                            if(a>46)
                                font-=10;
                        }
                    }
                }
            }

            for(var i=0; i<a; i++){                             //pętle do rysowania
                for(var j=0; j<a; j++){
//wole ten komentarz wstawić tutaj aby przypadkie nie popsuć tego niżej. Zmienna na dole jest odpowiedzialna za stworzenie
//pojedyńczej komórki. Tworzy ona: jej alias (na przyszłość, aby móc się odnosić do konkretnej komórki), id (nazwa),
//położenie (x,y), wymiary, obramowanie i wyśerodkowany tekst z numerem komórki. Następnie zapisuje ją do "second" czyli
//naszej drugiej strony. Informacja na koniec to nazwa wyśietlana w debuggerze gdy wystąpi jakiś błąd podczas tworzenia
//komórki;
                    var newObject = Qt.createQmlObject(
                                'import QtQuick 2.0
                                import "automatkomorkowy.js" as Logika
                                Rectangle {
                                    id: k'+automatGlobal.map[i][j].cellularID+'
                                    x: '+x+'
                                    y: '+y+'
                                    width: '+size+'
                                    height: '+size+'
                                    border.width: '+automatGlobal.map[i][j].values[3]+'
                                    color: Qt.rgba('+automatGlobal.map[i][j].values[0]/255+','+automatGlobal.map[i][j].values[1]/255+','+automatGlobal.map[i][j].values[2]/255+')
                                    Text {
                                        id: znak
                                        text: "'+automatGlobal.map[i][j].values[4]+'"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pointSize: '+font+'
                                    }
                                    MouseArea {
                                        anchors.fill: k'+automatGlobal.map[i][j].cellularID+'
                                        onClicked: {
                                            automatGlobal.currentX='+i+'
                                            automatGlobal.currentY='+j+'
                                            edytuj.visible=true
                                            var R=automatGlobal.map['+i+']['+j+'].actuallR, G=automatGlobal.map['+i+']['+j+'].actuallG, B=automatGlobal.map['+i+']['+j+'].actuallB;
                                            var k=1, napis=automatGlobal.map['+i+']['+j+'].values[0]+", ";
                                            while(k<automatGlobal.map['+i+']['+j+'].countOfValues && k<automatGlobal.map['+i+']['+j+'].values.length)
                                            {
                                                napis+=automatGlobal.map['+i+']['+j+'].values[k]+", ";
                                                k++;
                                            }
                                            opiskomorki.text="ID komórki: "+automatGlobal.map['+i+']['+j+'].cellularID+"\nPołożenie: kolumna:"+(automatGlobal.map['+i+']['+j+'].widthPosition+1)+", wiersz:"+(automatGlobal.map['+i+']['+j+'].heightPosition+1)+"\nColor (R: "+automatGlobal.map['+i+']['+j+'].values[R]+", G: "+automatGlobal.map['+i+']['+j+'].values[G]+", B: "+automatGlobal.map['+i+']['+j+'].values[B]+")\nIlość wartości komórki: "+automatGlobal.map['+i+']['+j+'].countOfValues+"\nWartości: "+napis+""
                                        }
                                    }
                                }',pincha,"rysowanie");
                    x+=size;
                }
                y+=size;
                x=0;
            }
        }

        Component.onCompleted: {                                            //przy stworzeniu strony sprawdza czy są już wczytane jakieś wartości do automatGlobal, jeśli tak to wyświetla odrazu siatkę;
            if(automatGlobal!=null){
                draw(automatGlobal.size);
                swipeView.incrementCurrentIndex()
            }
        }

        MyObject{
            id:myobject                                                     //obiekt do usuwania zapisanych iteracji automatu;
        }

        potwierdz.onClicked: {                                              //po kliknięcie przycisku Potwierdz zostaje zainicjalizowany automatGlobal oraz wyswietlony;
            automatGlobal=new Logika.CellularAutomation(parseInt(wprowadz_liczbe.text));
            automatGlobal.numberOfValues=parseInt(wprowadz_ile_danych.text);
            automatGlobal.initialize();
            iteracja=0;
            myobject.usun();
            automatGlobal.saveToFile(StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal.map);
            draw(automatGlobal.size);
            if(wczytaj_skrypt.length!=0)
                skrypt_url=StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/"+wczytaj_skrypt.text;
            swipeView.incrementCurrentIndex();
        }

        menu.onClicked: {                                                   //powrut do strony startowej;
            okno.visible=false
            automatGlobal=null;
            var component = Qt.createComponent("Strona_startowa.qml")
            var window    = component.createObject(apka)
        }
}
