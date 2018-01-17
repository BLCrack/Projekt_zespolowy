import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0
import "skrypt.js" as Zycie

Page {
    property var skrypt_url                                                 //zmienna globalna dla adresu URL skryptu;
    property alias okno: okno                                               //alias do obiektu Page z id: okno;
    property alias swipeView: swipeView                                     //alias do obiekt SwipeView z id: swipeView;
    id: okno
    width: Screen.width                                                     //ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")                                        //nazwa wyświetlana w oknie aplikacji na Windows;
    visible: true

//funkcaj odpowiedzialna za aktualizacje komórek w wyświetlanej siatce
    function updateDraw(){
        var counter=0, size=0, x=0, y=0;
        if(Screen.width<Screen.height)                                      //tutaj ustawiam rozmiar komórki;
            size=Screen.width/automatGlobal.size
        else{
            size =Screen.height;
            size=(size-140)/automatGlobal.size;
        }
        tlo.y=size*automatGlobal.size+1;                                    //ustawienie położenia i wysokości okna odpowiedzialnego za wyświetlanie wartości komórki;
        tlo.height=Screen.height-size*automatGlobal.size;
        for(var i=0; i<automatGlobal.size; i++){                            //aktualizacja pojedyńczych komórek pobierając wartości z automatGlobal;
            for(var j=0; j<automatGlobal.size; j++){
                //zmienne odpowiadają za numer wartości odpowiedzialnej za daną rzecz w automacie; R - kolor czerwony; G - kolor zielony; B - kolor niebiesk; Text - wyświetlany tekst; Frame - obramowanie;
                var R=automatGlobal.map[i][j].actuallR, G=automatGlobal.map[i][j].actuallG, B=automatGlobal.map[i][j].actuallB, Text=automatGlobal.map[i][j].actuallText, Frame=automatGlobal.map[i][j].actuallFrame;
                pincha.children[counter].x=x;
                pincha.children[counter].y=y;
                pincha.children[counter].width=size;
                pincha.children[counter].height=size;
                pincha.children[counter].color=Qt.rgba(automatGlobal.map[i][j].values[R],automatGlobal.map[i][j].values[G],automatGlobal.map[i][j].values[B]);
                pincha.children[counter].border.width=automatGlobal.map[i][j].values[Frame];
                pincha.children[counter].children[0].text=automatGlobal.map[i][j].values[Text];
                if(i==automatGlobal.currentX && j==automatGlobal.currentY)
                {
                    var k=1, napis=automatGlobal.map[i][j].values[0]+", ";
                    while(k<automatGlobal.map[i][j].countOfValues && k<automatGlobal.map[i][j].values.length)
                    {
                        napis+=automatGlobal.map[i][j].values[k]+", ";
                        k++;
                    }
                    opiskomorki.text="ID komórki: "+automatGlobal.map[i][j].cellularID+"\nPołożenie: kolumna:"+(automatGlobal.map[i][j].widthPosition+1)+", wiersz:"+(automatGlobal.map[i][j].heightPosition+1)+"\nColor (R: "+automatGlobal.map[i][j].values[R]+", G: "+automatGlobal.map[i][j].values[G]+", B: "+automatGlobal.map[i][j].values[B]+")\nIlość wartości komórki: "+automatGlobal.map[i][j].countOfValues+"\nWartości: "+napis+""
                }
                counter++;
                x+=size;
            }
            y+=size;
            x=0;
        }
        iter.text="Iteracja nr.: "+iteracja;                                //aktualizacja wyświetlanej iteracji;
    }

onHeightChanged: updateDraw()                                               //aktualizacja wartości siatki po zmianie orientacji ekranu;
onWidthChanged: updateDraw()

    Timer {                                                                 //obiekt czas, odpowiedzialny za automatyczne działanie programu;
        id:time
        interval: 500;
        running: false;
        repeat: true
        onTriggered: {
            automatGlobal.map=Zycie.scriptNextStep(automatGlobal);          //wywołanie skrypt;
            iteracja++;
            updateDraw();
            //zapis siatki automatu dla danego numeru iteracji
            automatGlobal.saveToFile(StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal.map);
        }
     }

    SwipeView {                                                             //odpowiada za przesuwanie stron;
        id: swipeView
        interactive: true
        anchors.fill: parent                                                //ustawia wymiary okna do wymiarów ustalonych wyżej;
        currentIndex: glowa.currentIndex

        Wprowadz_dane{                                                      //strona pierwsza. Jej wygląd i funkcje są opisane w Wprowadz_dane.qml i Wprowadz_daneForm.ui.qml;
        }

        Page{                                                               //stona druga. Na niej będie wyświetlana siatka automatu;
            property alias second: second                                   //alias do obiektu Page z id: second;
            property alias pincha: pincha                                   //alias do obiektu PinchArea z id: pincha;
            property alias flick: flick                                     //alias do obiektu Flickable z id: flick;
            property alias opiskomorki: opiskomorki                         //alias do obiektu Text z id: opiskomorki;
            property alias tlo: tlo                                         //alias do obiektu Rectangle z id: tlo;
            property alias iter: iter                                       //alias do obiektu Text z id: iter;
            property alias edytuj: edytuj                                   //alias do obiektu Button z id: edytuj;
            id: second

            Flickable{                                                      //obiekt pomocniczy do przybliżania siatki;
                id:flick
                anchors.fill: parent
                width: second.width
                height: second.height-100
                x: 0
                y: 0
                interactive: false

                PinchArea {                                                 //obiekt odpowiedzialny za przypliżanie przy pomocy dwóch palcy;
                    id: pincha
                    anchors.fill: parent
                    pinch.target: flick                                     //przypięcie przybliżenia do obiektu Flickable;
                    pinch.minimumScale: 1
                    pinch.maximumScale: 10
                    property real initialWidth
                    property real initialHeight
                    onPinchStarted: {                                       //pobiera wartości wielkości okna w obecnej skali;
                        initialWidth = flick.contentWidth
                        initialHeight = flick.contentHeight
                    }
                    onPinchUpdated: {                                       //pozwala na przesuwanie siatki przy użyciu dwóch palców;
                        flick.contentX += pinch.previousCenter.x - pinch.center.x
                        flick.contentY += pinch.previousCenter.y - pinch.center.y
                    }
                }
            }

            Rectangle{                                                      //obiek odpowiedzialny za tło pola w którym są wyświetlane wartości komórki;
                id: tlo
                color: "white"
                width: Screen.width

                Text{                                                       //obiekt w którym wyświetlamy wartości komórki;
                    id:opiskomorki
                    x: 0
                    width: Screen.width/2
                    font.pointSize: 12
                    wrapMode: Text.WordWrap
                }

                Text{                                                       //obiekt w którym wyświetlamy numer iteracji;
                    id:iter
                    x: Screen.width/2
                    text: "Iteracja nr.: "+iteracja
                    font.pointSize: 12
                    wrapMode: Text.WordWrap

                    Button{                                                 //przycisk do edycji komórki (przeniesienie na trzecią stronę);
                        id: edytuj
                        y:40
                        text:"Edytuj komórkę"
                        onClicked: swipeView.incrementCurrentIndex()
                        enabled: swipeView.currentIndex < swipeView.count - 1
                        height: 40
                    }
                }
            }
        }

        Page1{                                                              //trzecia strona. Na niej są wyświetlane ustawienia komórki;
        }
    }

    header: TabBar {                                                        //jest to pasek narzędzi który wyświetla ilość stron w nagłówku programu;
        id: glowa
        currentIndex: swipeView.currentIndex
        onCurrentIndexChanged: {                                            //zmiana wyświetlania obiektów w zależności na której stronie się znajdujemy;
            if (currentIndex==1 || currentIndex==3){
                pincha.visible=true;
                stopa.visible=true;
                tlo.visible=true;
                updateDraw();
            }
            else{

                flick.returnToBounds();
                pincha.visible=false;
                stopa.visible=false;
                tlo.visible=false;
            }
        }

        //przyciski odpowiedzialne za przesuwanie się po stronach oraz ustawianie widoczności obiektów na stronach po kliknięciu;
        TabButton {
            text: qsTr("First")
            height: 40
            onClicked: {flick.returnToBounds();pincha.visible=false;stopa.visible=false;tlo.visible=false;}
        }

        TabButton {
            text: qsTr("Second")
            height: 40
            onClicked: {pincha.visible=true;stopa.visible=true;tlo.visible=true; updateDraw();}
        }

        TabButton {
            id:edycjakomorki
            text: qsTr("Third")
            height: 40
            onClicked: {flick.returnToBounds();pincha.visible=false;stopa.visible=false;tlo.visible=false;}
        }
    }

    footer: TabBar {                                                        //stópka z przyciskami Previou, Start, Stop, Next odpowiedzialnymi za poruszanie się po automacie;
        id: stopa
        visible: false

        TabButton {                                                         //przycisk przechodzący po plikach w dół, coraz mniejsze numery iteracji;
            text: qsTr("Previous")
            x:0
            width: Screen.width/4
            height: 40
            onClicked: {
                if(iteracja>0)
                {
                    iteracja--;
                    automatGlobal.loadFromFile(StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal);
                    updateDraw();
                }
            }
        }

        TabButton {                                                         //przycisk uruchamiający automat;
            text: qsTr("Start")
            x:Screen.width/4
            width: Screen.width/4
            height: 40
            onClicked: {
                if(iteracja==0 && skrypt_url!=null)
                    Zycie.include(skrypt_url);
                time.start();
            }
        }

        TabButton {                                                         //przycisk zatrzymujący automat;
            text: qsTr("Stop")
            x:Screen.width/2
            width: Screen.width/4
            height: 40
            onClicked: time.stop();
        }

        TabButton {                                                         //przycisk przechodzący po plikach w górę, coraz większe numery iteracji;
            text: qsTr("Next")
            x:Screen.width-Screen.width/4
            width: Screen.width/4
            height: 40
            onClicked: {
                if(iteracja<40)
                {
                    iteracja++;
                    automatGlobal.loadFromFile(StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal);
                    updateDraw();
                }
            }
        }
    }
}
