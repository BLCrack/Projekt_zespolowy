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
            property alias pinch: pinch
            id: second
            PinchArea {                         //odpowiada za przypliżanie przy pomocy palcy
                id: pinch
                width: second.width
                height: second.height
                pinch.target: second
                pinch.minimumScale: 1
                pinch.maximumScale: 10
                onPinchStarted: {               //jeszcze nie wiem ja to dokładnie działa, więc zostawiam te komentarze które są;
                    initialWidth = second.contentWidth
                    initialHeight = second.contentHeight
                }
                onPinchUpdated: {
                    // adjust content pos due to drag
                    second.contentX += pinch.previousCenter.x - pinch.center.x
                    second.contentY += pinch.previousCenter.y - pinch.center.y

                    // resize content
                    second.resizeContent(initialWidth * pinch.scale, initialHeight * pinch.scale, pinch.center)
                }
                onPinchFinished: {
                    // Move its content within bounds.
                    second.returnToBounds()
                }
            }
        }
        Page1{                                  //trzecia strona. Na niej są wyświetlane stawienia komórki
        }
    }

    footer: TabBar {                            //jest to pasek narzędzi który wyświetla ilość stron w stópce programu
        id: stopa
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
            height: 40
        }
        TabButton {
            text: qsTr("Second")
            height: 40
        }
        TabButton {
            text: qsTr("Third")
            height: 40
        }
    }
}
