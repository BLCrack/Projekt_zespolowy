import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import Qt.labs.folderlistmodel 2.1
import Qt.labs.platform 1.0
import "automatkomorkowy.js" as Logika

ApplicationWindow {
    property alias apka:apka                                                //alias do obiektu ApplicationWindow z id: apka;
    property alias lista:lista                                              //alias do obiektu ListView z id: lista;
    property var automatGlobal                                              //zmienna globalan w której będzie przetrzymywany automat komórkowy;
    property var iteracja: 0                                                //zmienna globalna w której będzie przetrzymywany numer iteracji programu;
    id:apka
    visible: true
    visibility: Window.FullScreen                                           //uruchamia okno aplikaci w trybie FullScreen;
    width: Screen.width                                                     //ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")                                        //nazwa wyświetlana w oknie aplikacji na Windows;
    ListView {                                                              //obiekt odpowiedzialny za wyświetlanie listy zapisanych iteracji;
        id: lista
        visible: false
        width: Screen.width
        height: Screen.height

        FolderListModel {                                                   //ustawienie skąd ma być wyświetlane pliki i z jakim rozszeżeniem;
            id: folderModel
            nameFilters: ["*.JSON"]
            showDirs: false
            folder: StandardPaths.writableLocation(StandardPaths.DownloadLocation)
        }

        Component{                                                          //uruchomieni odpowiednio zbudowanego komponętu
            id: fileDelegate

            Button{                                                         //pliki są przedstawione w postaci przycisków, po kliknięci następuje wczytanie pliku i urumomienie programu na odpowiedniej stronie;
                text: fileName
                width: Screen.width
                onClicked: {
                    automatGlobal=new Logika.CellularAutomation(1);
                    automatGlobal.loadFromFile(StandardPaths.writableLocation(StandardPaths.DownloadLocation)+"/"+fileName,automatGlobal);
                    var text=fileName;
                    text=text.slice(12,text.length);
                    text=text.slice(0,text.indexOf("."));
                    iteracja=parseInt(text);
                    lista.visible=false;
                    var component = Qt.createComponent("glowny.qml");
                    var window    = component.createObject(apka);
                }
            }
        }

        Button{                                                             //przycisk do powrócenia na strone startową;
            text: "<-"
            width: Screen.width/3
            y: Screen.height-80
            onClicked: {
                lista.visible=false;
                var component = Qt.createComponent("Strona_startowa.qml");
                var window    = component.createObject(apka);
            }
        }

        model: folderModel
        delegate: fileDelegate
    }
    Strona_startowa{}                                                       //strona startowa z trzema przyciskami

    Page{}                                                                  //główne okno aplikacji z ustawieniami, siatką, itp.
}
