import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Strona_startowaForm {
    rozpocznij.onClicked: {                                 //uruchomienie głównej części programu
        start.visible=false
        var component = Qt.createComponent("glowny.qml")
        var window    = component.createObject(apka)
    }

    wczytaj.onClicked: {

    }

    wyjscie.onClicked:{                                     //zakończenie programu
        Qt.quit();
    }



}
