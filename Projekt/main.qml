import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    property alias apka:apka
    id:apka
    visible: true
    visibility: Window.FullScreen               // uruchamia okno aplikaci w trybie FullScreen;
    width: Screen.width                         // ustawia szerokość i wysokość okna zależnie od wielkości ekranu;
    height: Screen.height
    title: qsTr("Automat komorkowy")            //nazwa wyświetlana w oknie aplikacji na Windows;
    Strona_startowa{}                           //strona startowa z trzema przyciskami
    Page{}                                      //główne okno aplikacji z ustawieniami, siatką, itp.
}
