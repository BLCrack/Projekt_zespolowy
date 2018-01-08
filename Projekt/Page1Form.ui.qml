import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2


Item {
    //anchors.fill: parent
    //visible: true
    id: edycja
    width: 640
    height: 480
    property alias edycja: edycja
    property alias potwiedz_edycje: potwiedz_edycje
    property alias wart_czerw: wart_czerw
    property alias wart_ziel: wart_ziel
    property alias wart_nieb: wart_nieb
    property alias wart_tekst: wart_tekst
    property alias switch1: switch1
    property alias nr_chose: nr_chose
    property alias wart_chose: wart_chose

    Text {
        id: text1
        x: 116
        width: 320
        height: 40
        text: qsTr("Automat Komórkowy")
        anchors.horizontalCenterOffset: 2
        anchors.top: parent.top
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 33
    }

    Item {
        id: item1
        x: 91
        width: 326
        height: 389
        anchors.top: parent.top
        anchors.topMargin: 91
        anchors.horizontalCenter: parent.horizontalCenter

        Item {
            id: item2
            x: 0
            width: 326
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0

            Text {
                id: text3
                width: 155
                height: 40
                text: qsTr("Odpowiada za :")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 85
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 15
            }

            Text {
                id: text2
                width: 85
                height: 40
                text: qsTr("Nr wartości")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 16
            }

            Text {
                id: text6
                width: 86
                height: 40
                text: qsTr("Zmień")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 240
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 15
            }

        }

        Item {
            id: item3
            x: 9
            y: 0
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 41
            Text {
                id: text4
                width: 155
                height: 40
                text: qsTr("Natężenie czerwieni")
                anchors.top: parent.top
                font.pixelSize: 15
                anchors.topMargin: 0
                anchors.leftMargin: 85
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text5
                width: 85
                height: 40
                text: qsTr("1")
                anchors.top: parent.top
                font.pixelSize: 16
                anchors.topMargin: 0
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: wart_czerw
                x: 250
                width: 86
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 240
                anchors.left: parent.left
                inputMethodHints: Qt.ImhDigitsOnly
            }
        }

        Item {
            id: item4
            x: 10
            y: -5
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 82
            Text {
                id: text7
                width: 155
                height: 40
                text: qsTr("Natężenie zieleni")
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 85
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text8
                width: 85
                height: 40
                text: qsTr("2")
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 0
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: wart_ziel
                width: 86
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 240
                anchors.left: parent.left
                inputMethodHints: Qt.ImhDigitsOnly
            }
        }

        Item {
            id: item5
            x: 13
            y: -12
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 123
            Text {
                id: text9
                width: 155
                height: 40
                text: qsTr("Natężenie niebieskiego")
                anchors.top: parent.top
                font.pixelSize: 15
                anchors.topMargin: 0
                anchors.leftMargin: 85
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text10
                width: 85
                height: 40
                text: qsTr("3")
                anchors.top: parent.top
                font.pixelSize: 16
                anchors.topMargin: 0
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: wart_nieb
                width: 86
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 240
                anchors.left: parent.left
                inputMethodHints: Qt.ImhDigitsOnly
            }
        }

        Item {
            id: item6
            x: 4
            y: -12
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 164
            Text {
                id: text11
                width: 155
                height: 40
                text: qsTr("Wyświetlany tekst")
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 85
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text12
                width: 85
                height: 40
                text: qsTr("4")
                anchors.top: parent.top
                anchors.topMargin: 0
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 0
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: wart_tekst
                width: 86
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 240
                anchors.left: parent.left
            }
        }

        Item {
            id: item7
            x: 8
            y: -2
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 205
            Text {
                id: text13
                width: 155
                height: 40
                text: qsTr("Obramowanie")
                anchors.top: parent.top
                font.pixelSize: 15
                anchors.topMargin: 0
                anchors.leftMargin: 85
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Text {
                id: text14
                width: 85
                height: 40
                text: qsTr("5")
                anchors.top: parent.top
                font.pixelSize: 16
                anchors.topMargin: 0
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            Switch {
                id: switch1
                width: 86
                text: qsTr("")
                anchors.left: parent.left
                anchors.leftMargin: 240
                anchors.top: parent.top
                anchors.topMargin: 0
            }
        }

        Item {
            id: item8
            x: 12
            y: -12
            width: 326
            height: 40
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 246
            Text {
                id: text15
                width: 155
                height: 40
                text: qsTr("Brak funkcji")
                anchors.top: parent.top
                font.pixelSize: 15
                anchors.topMargin: 0
                anchors.leftMargin: 85
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: wart_chose
                width: 86
                text: qsTr("")
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 240
                anchors.left: parent.left
                inputMethodHints: Qt.ImhDigitsOnly
            }

            TextField {
                id: nr_chose
                width: 85
                text: qsTr("6")
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                inputMethodHints: Qt.ImhDigitsOnly
            }
        }

        Button {
            id: potwiedz_edycje
            x: 113
            text: qsTr("Potwierdź")
            anchors.top: parent.top
            anchors.topMargin: 305
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
