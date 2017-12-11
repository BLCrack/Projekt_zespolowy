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
    property alias text2: text2
    property alias text3: text3
    property alias wartosc_r: wartosc_r
    property alias potwierdz_r: potwierdz_r
    property alias edycja: edycja
    property alias wartosc_g: wartosc_g
    property alias potwierdz_g: potwierdz_g
    property alias wartosc_b: wartosc_b
    property alias potwierdz_b: potwierdz_b

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
        height: 368
        anchors.verticalCenterOffset: 22
        anchors.horizontalCenterOffset: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 78

        RowLayout {
            id: blue
            width: 282
            height: 38
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 195

            TextField {
                id: wartosc_b
                text: qsTr("")
            }

            Button {
                id: potwierdz_b
                text: qsTr("Potwierdź")
            }
        }

        RowLayout {
            id: green
            width: 282
            height: 38
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 130
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: wartosc_g
                text: qsTr("")
            }

            Button {
                id: potwierdz_g
                text: qsTr("Potwierdź")
            }
        }

        RowLayout {

            id: red
            x: 37
            width: 282
            height: 38
            anchors.horizontalCenterOffset: 0
            anchors.top: parent.top
            anchors.topMargin: 65
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: wartosc_r
                width: 142
                height: 38
                text: qsTr("")
                Layout.fillWidth: false
                Layout.fillHeight: false
            }

            Button {
                id: potwierdz_r
                text: qsTr("Potwierdź")
                Layout.fillWidth: false
                Layout.fillHeight: false
            }
        }

        Text {
            id: text2
            x: 37
            width: 282
            height: 38
            text: qsTr("Zmień natężenie czerwieni:")
            anchors.horizontalCenterOffset: 2
            anchors.top: parent.top
            anchors.topMargin: 35
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }

        Text {
            id: text3
            width: 282
            height: 38
            text: qsTr("Zmień natężenie zieleni:")
            anchors.horizontalCenterOffset: 2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 102
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }

        Text {
            id: text4
            y: 169
            width: 282
            height: 38
            text: qsTr("Zmień natężenie niebieskiego:")
            anchors.horizontalCenterOffset: 2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 165
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }

        RowLayout {
            id: znak
            y: 260
            width: 282
            height: 38
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 260

            TextField {
                id: wartosc_znak
                width: 200
                text: qsTr("")
            }

            Button {
                id: potwierdz_znak
                x: 206
                width: 100
                text: qsTr("Potwierdź")
            }
        }

        Text {
            id: text5
            x: 37
            y: 236
            width: 282
            height: 38
            text: qsTr("Zmień Znak:")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 228
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }

        Text {
            id: text6
            width: 282
            height: 38
            text: qsTr("Wybierz komórkę ")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
            font.pixelSize: 17
        }

        Text {
            id: obramowanie
            text: qsTr("Obramowanie:")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 305
            font.pixelSize: 14
        }

        Switch {
            id: switch1
            text: qsTr("Wyłącz/Włącz")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 315
        }
    }
}


