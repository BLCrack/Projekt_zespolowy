import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    property alias textField1: textField1                   //ustawienie aliasów dla korzystania z tych elementów w
    property alias button1: button1                         //innych częściach programu;
    property alias item1: item1

    id:item1

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {                                         //miejsce do wpisywania tekstu;
            id: textField1
            placeholderText: qsTr("Podaj wymiar tablicy")
        }

        Button {                                            //przycisk;
            id: button1
            text: qsTr("Potwierdz")
        }
    }
}
