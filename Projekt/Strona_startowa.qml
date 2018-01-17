import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Qt.labs.platform 1.0

Strona_startowaForm {
    rozpocznij.onClicked: {                                                 //uruchomienie głównej części programu;
        start.visible=false
        var component = Qt.createComponent("glowny.qml")
        var window    = component.createObject(apka)
    }

    wczytaj.onClicked: {                                                    //cofnięcie się do strony startowej;
        start.visible=false;
        lista.visible=true;
    }

    wyjscie.onClicked:{                                                     //zakończenie programu;
        Qt.quit();
    }
}
