import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property alias wprowadz: wprowadz
    property alias textField: textField
    id: wprowadz
    width: 640
    height: 480
    property alias rysuj: rysuj
    property alias menu: menu

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

    Grid {
        id: grid
        x: 146
        width: 352
        height: 342
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 69

        RowLayout {
            id: rowLayout1
            width: 282
            height: 38
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 160

            TextField {
                id: ilosc_danych
                text: qsTr("")
            }

            Button {
                id: button
                text: qsTr("Potwierdź")
            }
        }

        RowLayout {
            id: rowLayout2
            width: 282
            height: 38
            anchors.top: parent.top
            anchors.topMargin: 95
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: skrypt
                text: qsTr("")
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }

            Button {
                id: button1
                text: qsTr("Potwierdź")
            }
        }

        RowLayout {

            id: rowLayout
            width: 282
            height: 38
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: textField
                width: 142
                height: 38
                text: qsTr("")
                Layout.fillWidth: false
                Layout.fillHeight: false
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }

            Button {
                id: rysuj
                text: qsTr("Rysuj")
                Layout.fillWidth: false
                Layout.fillHeight: false
            }
        }

        Text {
            id: text2
            width: 282
            height: 38
            text: qsTr("Wprowadź długość boku kratki:")
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }

        Text {
            id: text3
            width: 282
            height: 38
            text: qsTr("Wprowadź ilość danych w vektorze:")
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 67
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }

        Text {
            id: text4
            width: 282
            height: 38
            text: qsTr("Wczytaj skrypt:")
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 130
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }

        Button {
            id: menu
            text: qsTr("Wróć do menu")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 300
        }

        Button {
            id: zapisz_stan
            text: qsTr("Zapisz stan")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 220
        }
    }
}


