import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import Qt.labs.platform 1.0

Item {
    property alias rozpocznij: rozpocznij                                  //alias do Button o id:rozpocznij
    property alias wczytaj: wczytaj                                        //alias do Button o id:wczytaj
    property alias wyjscie: wyjscie                                        //alias do Button o id:wyjscie
    property alias start:start                                             //alias do Item o id:start
    anchors.fill: parent
    visible: true
    id: start
    width: 640
    height: 480

    Text {
        id: text1
        x: 231
        width: 320
        height: 40
        text: qsTr("Automat Komórkowy")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 33
    }

    Button {
        id: rozpocznij
        x: 240
        y: 168
        width: 160
        height: 60
        text: qsTr("Rozpocznij")
        anchors.verticalCenterOffset: -85
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
    }

    Button {
        id: wczytaj
        x: 240
        y: 226
        width: 160
        height: 60
        text: qsTr("Wczytaj")
        anchors.verticalCenterOffset: 11
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
    }

    Button {
        id: wyjscie
        x: 240
        y: 346
        width: 160
        height: 60
        text: qsTr("Wyjście")
        anchors.verticalCenterOffset: 107
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
    }
}
