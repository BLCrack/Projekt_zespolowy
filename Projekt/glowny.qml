import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.0
import "skrypt.js" as Zycie

Page {
    property var skrypt
    property alias okno: okno
    property alias swipeView: swipeView
    id: okno
    width: Screen.width                         // ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")            //nazwa wyświetlana w oknie aplikacji na Windows;
    visible: true

    function updateDraw(){
        var counter=0, size=0, x=0, y=0;
        if(Screen.width<Screen.height)                      //tutaj ustawiam rozmiar komórki
            size=Screen.width/automatGlobal.size
        else{
            size =Screen.height;
            size=(size-140)/automatGlobal.size;
        }
        tlo.y=size*automatGlobal.size+1;
        tlo.height=Screen.height-size*automatGlobal.size;
        for(var i=0; i<automatGlobal.size; i++){
            for(var j=0; j<automatGlobal.size; j++){
                pincha.children[counter].x=x;
                pincha.children[counter].y=y;
                pincha.children[counter].width=size;
                pincha.children[counter].height=size;
                pincha.children[counter].color=Qt.rgba(automatGlobal.map[i][j].values[0],automatGlobal.map[i][j].values[1],automatGlobal.map[i][j].values[2]);
                pincha.children[counter].border.width=automatGlobal.map[i][j].values[3];
                pincha.children[counter].children[0].text=automatGlobal.map[i][j].values[4];
                if(i==automatGlobal.currentX && j==automatGlobal.currentY)
                {
                    var k=1, napis=automatGlobal.map[i][j].values[0]+", ";
                    while(k<automatGlobal.map[i][j].countOfValues && k<automatGlobal.map[i][j].values.length)
                    {
                        napis+=automatGlobal.map[i][j].values[k]+", ";
                        k++;
                    }
                    opiskomorki.text="ID komórki: "+automatGlobal.map[i][j].cellularID+"\nPołożenie: kolumna:"+(automatGlobal.map[i][j].widthPosition+1)+", wiersz:"+(automatGlobal.map[i][j].heightPosition+1)+"\nColor (R: "+automatGlobal.map[i][j].values[0]+", G: "+automatGlobal.map[i][j].values[1]+", B: "+automatGlobal.map[i][j].values[2]+")\nIlość wartości komórki: "+automatGlobal.map[i][j].countOfValues+"\nWartości: "+napis+""
                }
                counter++;
                x+=size;
            }
            y+=size;
            x=0;
        }
        iter.text="Iteracja nr.: "+iteracja;
    }
onHeightChanged: updateDraw()
onWidthChanged: updateDraw()

    Timer {
        id:time
        interval: 500;
        running: false;
        repeat: true

        onTriggered: {
            automatGlobal.map=Zycie.scriptNextStep(automatGlobal);
            iteracja++;
            updateDraw();
            automatGlobal.saveToFile(StandardPaths.writableLocation(StandardPaths./*DocumentsLocation*/HomeLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal.map);
        }
     }

    SwipeView {                                 //odpowiada za przesuwanie stron;
        id: swipeView
        interactive: true                      //wyłącza funkcje przesuwania strony palce;
        anchors.fill: parent                    //ustawia wymiary okna do wymiarów ustalonych wyżej;
        currentIndex: glowa.currentIndex

        Wprowadz_dane{                          //strona pierwsza. Jej wygląd i funkcje są opisane w Wprowadz_dane.qml i Wprowadz_daneForm.ui.qml;
        }

        Page{                                   //stona druga. Na niej będie wyświetlana siatka automatu;
            property alias second: second       //jest to alias który pozwala na odwoływanie się do tego elementu w innych częściach programu;
            property alias pincha: pincha
            property alias flick: flick
            property alias opiskomorki: opiskomorki
            property alias tlo: tlo
            property alias iter: iter
            property alias edytuj: edytuj
            id: second
            Flickable{                          //opakowanie pomocnicze do przybliżania siatki
                id:flick
                anchors.fill: parent
                width: second.width
                height: second.height-100
                x: 0
                y: 0
                interactive: false
                PinchArea {                     //odpowiada za przypliżanie przy pomocy palcy
                    id: pincha
                    anchors.fill: parent
                    pinch.target: flick
                    pinch.minimumScale: 1
                    pinch.maximumScale: 10
                    property real initialWidth
                    property real initialHeight
                    onPinchStarted: {           //pobiera wartości wielkości okna w obecnej skali
                        initialWidth = flick.contentWidth
                        initialHeight = flick.contentHeight
                    }

                    onPinchUpdated: {           //pozwala na przesuwanie siatki przy użyciu dwóch palców
                        flick.contentX += pinch.previousCenter.x - pinch.center.x
                        flick.contentY += pinch.previousCenter.y - pinch.center.y
                    }
                }
            }
            Rectangle{
                id: tlo
                color: "white"
                width: Screen.width
                Text{
                    id:opiskomorki
                    x: 0
                    width: Screen.width/2
                    font.pointSize: 12
                    wrapMode: Text.WordWrap
                }
                Text{
                    id:iter
                    x: Screen.width/2
                    text: "Iteracja nr.: "+iteracja
                    font.pointSize: 12
                    wrapMode: Text.WordWrap
                    Button{
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
        Page1{                                  //trzecia strona. Na niej są wyświetlane ustawienia komórki

        }
    }
    header: TabBar {                            //jest to pasek narzędzi który wyświetla ilość stron w stópce programu
        id: glowa
        currentIndex: swipeView.currentIndex
        onCurrentIndexChanged: {
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
    footer: TabBar {                              //nagłówek z przyciskami start i stop
        id: stopa
        visible: false
        TabButton {
            text: qsTr("Previous")
            x:0
            width: Screen.width/4
            height: 40
            onClicked: {
                if(iteracja>0)
                {
                    iteracja--;
                    automatGlobal.loadFromFile(StandardPaths.writableLocation(StandardPaths./*DocumentsLocation*/HomeLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal);
                    updateDraw();
                }
            }
        }
        TabButton {
            text: qsTr("Start")
            x:Screen.width/4
            width: Screen.width/4
            height: 40
            onClicked: time.start();
        }
        TabButton {
            text: qsTr("Stop")
            x:Screen.width/2
            width: Screen.width/4
            height: 40
            onClicked: time.stop();
        }
        TabButton {
            text: qsTr("Next")
            x:Screen.width-Screen.width/4
            width: Screen.width/4
            height: 40
            onClicked: {
                if(iteracja<40)
                {
                    iteracja++;
                    automatGlobal.loadFromFile(StandardPaths.writableLocation(StandardPaths./*DocumentsLocation*/HomeLocation)+"/iteracja_nr."+iteracja+".JSON",automatGlobal);
                    updateDraw();
                }
            }
        }
    }
}
