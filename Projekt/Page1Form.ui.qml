import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    height: 480
    property alias rectangle: rectangle

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top
    }

    Text {
        id: text1
        x: 8
        y: 8
        width: 268
        height: 58
        text: qsTr("Hello Word!!!")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 28
    }


    Rectangle {
        id: rectangle
        x: 8
        y: 72
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle1
        x: 74
        y: 72
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle2
        x: 142
        y: 72
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle3
        x: 208
        y: 72
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle4
        x: 8
        y: 131
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle5
        x: 74
        y: 131
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle6
        x: 142
        y: 131
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle7
        x: 208
        y: 131
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle8
        x: 8
        y: 189
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle9
        x: 74
        y: 189
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle10
        x: 142
        y: 189
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }

    Rectangle {
        id: rectangle11
        x: 208
        y: 189
        width: 68
        height: 59
        color: "#ffffff"
        border.width: 2
    }
}
