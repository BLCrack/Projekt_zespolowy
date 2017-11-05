import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    visibility: Window.FullScreen               // uruchamia okno aplikaci w trybie FullScreen;
    width: Screen.width                         // ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")            //nazwa wyświetlana w oknie aplikacji na Windows;

    SwipeView {                                 //odpowiada za przesuwanie stron;
        id: swipeView
        interactive: false                      //wyłącza funkcje przesuwania strony palce;
        anchors.fill: parent                    //ustawia wymiary okna do wymiarów ustalonych wyżej;
        currentIndex: tabBar.currentIndex

        Page1 {                                 //strona pierwsza. Jej wygląd i funkcje są opisane w Page1.qml i Page1Form.ui.qml;
        }

        Page{                                   //stona druga. Na niej będie wyświetlana siatka automatu;
            property alias second: second       //jest to alias który pozwala na odwoływanie się do tego elementu w innych częściach programu;
            id: second
            PinchArea {
                id: pinch
                width: second.width
                height: second.height
                pinch.target: second
                pinch.minimumScale: 1
                pinch.maximumScale: 10
                pinch.dragAxis: Pinch.XAndYAxis
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
    }

    footer: TabBar {                            //jest to pasek narzędzi który wyświetla ilość stron w stópce programu
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
