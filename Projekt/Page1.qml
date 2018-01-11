import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

Page1Form {
    potwiedz_edycje.onClicked: {
        var x=automatGlobal.currentX, y=automatGlobal.currentY;
        if(wart_czerw.length!=0 && automatGlobal.map[x][y].countOfValues>=1)
            automatGlobal.map[x][y].values[0]=parseFloat(wart_czerw.text);
        if(wart_ziel.length!=0 && automatGlobal.map[x][y].countOfValues>=2)
            automatGlobal.map[x][y].values[1]=parseFloat(wart_ziel.text);
        if(wart_nieb.length!=0 && automatGlobal.map[x][y].countOfValues>=3)
            automatGlobal.map[x][y].values[2]=parseFloat(wart_nieb.text);
        if(automatGlobal.map[x][y].countOfValues>=4)
        {
            if(switch1.checked)
                automatGlobal.map[x][y].values[3]=1.0;
            else
                automatGlobal.map[x][y].values[3]=0.0;
        }
        if(wart_tekst.length!=0 && automatGlobal.map[x][y].countOfValues>=5)
            automatGlobal.map[x][y].values[4]=wart_tekst.text;

        if(wart_chose.length!=0 && parseInt(nr_chose)>5 && automatGlobal.map[x][y].countOfValues>=parseInt(nr_chose) && automatGlobal.map[x][y].values.length>parseInt(nr_chose))
            automatGlobal.map[x][y].values[parseInt(nr_chose)-1]=parseFloat(wart_chose.text);
        swipeView.decrementCurrentIndex();
    }
}
