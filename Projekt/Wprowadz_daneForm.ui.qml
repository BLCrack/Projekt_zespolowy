import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property alias wprowadz: wprowadz
    property alias textField: textField
    //anchors.fill: parent
    //visible: true
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
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 33
    }

    Text {
        id: text2
        x: 180
        width: 282
        height: 38
        text: qsTr("Wprowadź długość boku kratki:")
        anchors.horizontalCenterOffset: 2
        anchors.top: parent.top
        anchors.topMargin: 110
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    RowLayout {

        id: rowLayout
        x: 180
        width: 282
        height: 38
        anchors.horizontalCenterOffset: 2
        anchors.top: parent.top
        anchors.topMargin: 145
        anchors.horizontalCenter: parent.horizontalCenter

        TextField {
            id: textField
            width: 142
            height: 38
            text: qsTr("")
            Layout.fillWidth: false
            Layout.fillHeight: false
        }

        Button {
            id: rysuj
            text: qsTr("Rysuj")
            Layout.fillWidth: false
            Layout.fillHeight: false
        }
    }

    Button {
        id: menu
        x: 270
        text: qsTr("Wróć do menu")
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 203
    }
}


