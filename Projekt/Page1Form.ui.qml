import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

ColumnLayout {
    property alias ustaw: ustaw
    id:ustaw
    width: Screen.width
    height: Screen.height

    RowLayout {
        id: rowLayout
        width: Screen.width/3
        height: Screen.height/3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        TextField {
            id: textField
            placeholderText: qsTr("Tekst do wyświetlenia")
        }

        Button {
            id: button
            text: qsTr("Potwierdz")
        }
    }

    RowLayout {
        id: rowLayout1
        width: Screen.width/3
        height: Screen.height/3
        anchors.horizontalCenter: parent.horizontalCenter
        TextField {
            id: textField1
            placeholderText: qsTr("Grubość obramowania, np. 4")
        }

        Button {
            id: button1
            text: qsTr("Potwierdz")
        }
    }

    RowLayout {
        id: rowLayout2
        width: Screen.width/3
        height: Screen.height/3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 60
        TextField {
            id: textField2
            placeholderText: qsTr("Kolor, np. red")
        }

        Button {
            id: button2
            text: qsTr("Potwierdz")
        }
    }
}
