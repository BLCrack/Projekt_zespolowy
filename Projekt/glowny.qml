import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Page {
    property alias okno: okno
    property alias swipeView: swipeView
    id: okno
    width: Screen.width                         // ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")            //nazwa wyświetlana w oknie aplikacji na Windows;
    visible: true
    header: Item {                              //nagłówek z przyciskami start i stop
        id: glowa
        TabButton {
            text: qsTr("Start")
            x:0
            width: Screen.width/2
            height: 40
        }
        TabButton {
            text: qsTr("Stop")
            x:Screen.width/2
            width: Screen.width/2
            height: 40
        }
    }

    SwipeView {                                 //odpowiada za przesuwanie stron;
        id: swipeView
        interactive: false                      //wyłącza funkcje przesuwania strony palce;
        anchors.fill: parent                    //ustawia wymiary okna do wymiarów ustalonych wyżej;
        currentIndex: stopa.currentIndex

        Wprowadz_dane{                          //strona pierwsza. Jej wygląd i funkcje są opisane w Wprowadz_dane.qml i Wprowadz_daneForm.ui.qml;
        }

        Page{                                   //stona druga. Na niej będie wyświetlana siatka automatu;
            property alias second: second       //jest to alias który pozwala na odwoływanie się do tego elementu w innych częściach programu;
            property alias pincha: pincha
            property alias flick: flick
            property alias opiskomorki: opiskomorki
            id: second
            Flickable{                          //opakowanie pomocnicze do przybliżania siatki
                id:flick
                anchors.fill: parent
                width: second.width
                height: second.height
                interactive: false
                PinchArea {                     //odpowiada za przypliżanie przy pomocy palcy
                    id: pincha
                    width: flick.width
                    height: flick.height
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
                Text {
                    id:opiskomorki
                    x: 20
                    y: Screen.height-80
                    width: Screen.width
                    font.pointSize: 10
                }
            }
        }
        Page1{                                  //trzecia strona. Na niej są wyświetlane ustawienia komórki
        }
    }

    footer: TabBar {                            //jest to pasek narzędzi który wyświetla ilość stron w stópce programu
        id: stopa
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
            height: 40
            onClicked: {flick.returnToBounds();pincha.visible=false}
        }
        TabButton {
            text: qsTr("Second")
            height: 40
            onClicked: pincha.visible=true
        }
        TabButton {
            text: qsTr("Third")
            height: 40
            onClicked: {flick.returnToBounds();pincha.visible=false}
        }
    }
}
