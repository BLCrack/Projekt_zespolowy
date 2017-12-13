function CellularAutomation(size)
{
    this.size = size;
    this.countOfCellulars = size*size;
    this.map = new Array(size);
    this.currentX = null;
    this.currentY = null;

    //tablica dwuwymiarowa
    for(var i=0; i<this.size; i++)
    {
        this.map[i] = new Array(size);
    }
}

//NOWA GRA
CellularAutomation.prototype.initialize = function()
{
    this.currentX = 0;
    this.currentT = 0;
    //tworzenie komórek na planszy
    var index = 0;
    for(var height=0; height<this.size; height++)
    {
        for(var width=0; width<this.size; width++)
        {
            //losujemy czy przy starcie bedzie martwa czy zywa
            var rand = Math.random()*10;
            var isLive;
            var r,g,b,obramowanie;
            var tekst = "";
            if(rand<5)
            {
                isLive = false; //nie zywa
                r=255.0;
                g=0.0;
                b=0.0;
                obramowanie = 0.0;
            }
            else
            {
                isLive = true; //zywa
                r = 0.0;
                g = 255.0;
                b = 0.0;
                obramowanie = 1.0;
            }
            //losujemy wartosci komorek
            var tabOfValues = new Array(r,g,b,obramowanie,tekst); //randomowe wartosci rgb do dla komórki
            this.map[height][width] = new Cellular(index, height, width,5, tabOfValues) //true or false zaleznie czy zyje czy nie
            index++;
        }
    }

};

CellularAutomation.prototype.loadFromFile = function(fileUrl)
{
    function setElements(arr)   //funkcja ustawiajaca elementy komorki z pliku
        {
            var edge_length = arr.length;
            var c = new Array(edge_length);

            for(var i = 0; i < edge_length; i++)    //tablica dwuwymiarowa
            {
                c[i] = new Array(edge_length);
                for(var j = 0; j < edge_length; j++)
                {
                    c[i][j]= new Cellular( arr[i][j].cellularID, arr[i][j].heightPosition, arr[i][j].widthPosition, arr[i][j].countOfValues, arr[i][j].values)  //ustawianie elementow do tablicy dwuwymiarowej
                }
            }
            return c;
        }

        var request = new XMLHttpRequest();    				 //wczytywanie odbywa sie za pomoca XMLHttpRequest
        request.open("GET", fileUrl, false);
        request.send(null);
        var myArr = JSON.parse(request.responseText);		//parsowanie z pliku JSON
        var object = setElements(myArr);
        var edge_length = object.length;

        for(var i=0; i < edge_length; i++)    //wypisywanie do konsoli argumentow komorki, nie jest potrzebne do poprawnego dzialania programu
        {
            for(var j=0;j<edge_length;j++)
            {
                console.log(object[i][j].cellularID);
                console.log(object[i][j].heightPosition);
                console.log(object[i][j].widthPosition);
                console.log(object[i][j].countOfValues);
                console.log(object[i][j].values);
            }
        }
        console.log('Wielkosc tablicy dwuwymiarowej:', edge_length, 'x', edge_length);
        return object;    // zwrocenie calego obiektu automatu
};

CellularAutomation.prototype.saveToFile = function()
{

};

function Cellular(ID, heightPosition, widthPosition, countOfValues, values)
{
    this.cellularID = ID;
    this.heightPosition = heightPosition;
    this.widthPosition = widthPosition;
    this.countOfValues = countOfValues;
    this.values = new Array(countOfValues);
    this.values = values;
}
