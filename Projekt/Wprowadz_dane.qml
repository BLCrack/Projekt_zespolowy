import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "automatkomorkowy.js" as Logika

Wprowadz_daneForm {
    //poniżej znajduje się funkcja która jest odpowiedzialna za dynamiczne rysowanie komórek. Parametr który pobiera to tekst wpisany przez użytkownika.
    //gdy podamy coś innego niż liczbę funkcja nic nie robi;
        function draw(a) {
            var x=0,y=0, size=0, font=12;                     //zmienne. Mam nadzieje że nazwy są wystarczająco jasne;
            a = parseInt(a);                                    //tutaj funkcja przekształca podany tekst na liczbę;

            automatGlobal=new Logika.CellularAutomation(a);
            automatGlobal.initialize();

            if(pincha.children!=null)
                for(var k=pincha.children.length; k>0;k--)
                    pincha.children[k-1].destroy();

            iteracja=0;
            opiskomorki.text=""
            edytuj.visible=false

            if(Screen.width<Screen.height)                      //tutaj ustawiam rozmiar komórki
                size=Screen.width/a
            else{
                size =Screen.height;
                size=(size-140)/a;
            }
            tlo.y=size*a+1;
            tlo.height=Screen.height-size*a;
            if(a>14&&a<23)
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
                                    color: Qt.rgba('+automatGlobal.map[i][j].values[0]+','+automatGlobal.map[i][j].values[1]+','+automatGlobal.map[i][j].values[2]+')
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
                                            opiskomorki.text="ID komórki: "+automatGlobal.map['+i+']['+j+'].cellularID+"\nPołożenie: kolumna:"+(automatGlobal.map['+i+']['+j+'].widthPosition+1)+", wiersz:"+(automatGlobal.map['+i+']['+j+'].heightPosition+1)+"\nColor (R: "+automatGlobal.map['+i+']['+j+'].values[0]+", G: "+automatGlobal.map['+i+']['+j+'].values[1]+", B: "+automatGlobal.map['+i+']['+j+'].values[2]+")\nIlość wartości komórki: "+automatGlobal.map['+i+']['+j+'].countOfValues+"\nWartości: "+automatGlobal.map['+i+']['+j+'].values[0]+", "+automatGlobal.map['+i+']['+j+'].values[1]+", "+automatGlobal.map['+i+']['+j+'].values[2]+", "+automatGlobal.map['+i+']['+j+'].values[3]+", "+automatGlobal.map['+i+']['+j+'].values[4]+""
                                        }
                                    }

                                }',pincha,"rysowanie");

                    x+=size;                                   //przesuwamy x o szerokość komórki;
                }
                y+=size;                                      //przesuwamy y o wysokość komórki;
                x=0;                                            //ustawiamy x na początek;
            }
        }
        rysuj.onClicked: {                                      //event opisujący kliknięcie przycisku;
            draw(textField.text);
        }
        menu.onClicked: {                                       //uruchomienie strony strtowej. Klawisz powrotu.
            okno.visible=false
            var component = Qt.createComponent("Strona_startowa.qml")
            var window    = component.createObject(apka)
        }
}
