import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: wprowadz
    width: 640
    height: 480
    property alias menu: menu
    property alias potwierdz: potwierdz
    property alias zapisz_stan: zapisz_stan
    property alias wprowadz_liczbe: wprowadz_liczbe
    property alias wczytaj_skrypt: wczytaj_skrypt
    property alias wprowadz_ile_danych: wprowadz_ile_danych

    Text {
        id: text1
        x: 116
        width: 320
        height: 40
        text: qsTr("Automat Komórkowy")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 45
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 33
    }

    Item {
        id: item1
        x: 162
        width: 339
        height: 389
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 91

        Text {
            id: text2
            x: 29
            width: 282
            height: 30
            text: qsTr("Wprowadź długość boku kratki")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            font.pixelSize: 15
        }

        TextField {
            id: wprowadz_liczbe
            x: 70
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 31
            anchors.horizontalCenter: parent.horizontalCenter
            inputMethodHints: Qt.ImhDigitsOnly
        }

        Text {
            id: text3
            x: 140
            width: 282
            height: 30
            text: qsTr("Wprowadź ilość danych w wektorze")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 72
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
        }

        TextField {
            id: wprowadz_ile_danych
            x: 75
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 103
            anchors.horizontalCenter: parent.horizontalCenter
            inputMethodHints: Qt.ImhDigitsOnly
        }

        Text {
            id: text4
            x: 146
            width: 282
            height: 30
            text: qsTr("Wczytaj skrypt")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 144
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
        }

        TextField {
            id: wczytaj_skrypt
            x: 91
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 175
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: potwierdz
            x: 120
            text: qsTr("Potwierdź")
            clip: false
            anchors.top: parent.top
            anchors.topMargin: 234
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: zapisz_stan
            x: 120
            text: qsTr("Zapisz Stan")
            anchors.top: parent.top
            anchors.topMargin: 291
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            id: menu
            x: 120
            text: qsTr("Wróć do Menu")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 348
        }
    }
}
