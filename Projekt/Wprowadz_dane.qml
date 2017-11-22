import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Wprowadz_daneForm {
    //poniżej znajduje się funkcja która jest odpowiedzialna za dynamiczne rysowanie komórek. Parametr który pobiera to tekst wpisany przez użytkownika.
    //gdy podamy coś innego niż liczbę funkcja nic nie robi;
        function draw(a) {
            var x=0,y=40,counter=1, width=0, height=0;           //zmienne. Mam nadzieje że nazwy są wystarczająco jasne;
            a = parseInt(a);                                    //tutaj funkcja przekształca podany tekst na liczbę;
            width = Screen.width/a;                             //tutaj ustawiam szerokość pojedyńczej komórki;
            height =Screen.height;                              //tutaj ustawiam wysokość pojedyńczej komórki. Ta wartość 100 jest odejmowana ponieważ
            height=height-140;                                  //nie mogę na razie pograć wysokości stópki programu i gdzyby nie ona to funkcja rysowała by
            height = height/a;                                  //komórki pod przyciskami stron;
            var background = Qt.createQmlObject(                //tworz białe tło na którym jest wyświetlana siatka;
                        'import QtQuick 2.0;
                        import QtQuick.Window 2.2
                        Rectangle {
                            x: 0
                            y: 0
                            width: Screen.width
                            height: Screen.height
                            border.width: 0
                            color: "white"
                        }',pinch,"rysowanie");
            for(var i=0; i<a; i++){                             //pętle do rysowania
                for(var j=0; j<a; j++){
    //wole ten komentarz wstawić tutaj aby przypadkie nie popsuć tego niżej. Zmienna na dole jest odpowiedzialna za stworzenie
    //pojedyńczej komórki. Tworzy ona: jej alias (na przyszłość, aby móc się odnosić do konkretnej komórki), id (nazwa),
    //położenie (x,y), wymiary, obramowanie i wyśerodkowany tekst z numerem komórki. Następnie zapisuje ją do "second" czyli
    //naszej drugiej strony. Informacja na koniec to nazwa wyśietlana w debuggerze gdy wystąpi jakiś błąd podczas tworzenia
    //komórki;
                    var newObject = Qt.createQmlObject(
                                'import QtQuick 2.0;
                                Rectangle {
                                    property alias k: k
                                    id: k
                                    x: '+x+'
                                    y: '+y+'
                                    width: '+width+'
                                    height: '+height+'
                                    border.width: 1
                                    Text {
                                        text: "'+counter+'"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.verticalCenter: parent.verticalCenter
                                        font.pointSize: 12
                                    }
                                    MouseArea {
                                        anchors.fill: k
                                        onClicked: {
                                            k.color="#ff0000"
                                        }
                                    }

                                }',pinch,"rysowanie");

                    x+=width;                                   //przesuwamy x o szerokość komórki;
                    counter++;                                  //zwiększamy licznik;
                }
                y+=height;                                      //przesuwamy y o wysokość komórki;
                x=0;                                            //ustawiamy x na początek;
            }
        }

        rysuj.onClicked: {                                      //event opisujący kliknięcie przycisku;
            draw(textField.text);
        }
        onHeightChanged: {
            draw(textField.text);
        }
        onWidthChanged: {
            draw(textField.text);
        }
        menu.onClicked: {                                       //uruchomienie strony strtowej. Klawisz powrotu.
            okno.visible=false
            var component = Qt.createComponent("Strona_startowa.qml")
            var window    = component.createObject(apka)
        }
}