function CellularAutomation(size){
    this.size = size;
    this.countOfCellulars = size*size;
    this.map = new Array(size);
    this.currentX = -1;
    this.currentY = -1;
    this.numberOfValues = null;

    //tablica dwuwymiarowa
    for(var i=0; i<this.size; i++){
        this.map[i] = new Array(size);
    }
}

//funkcja inicjalizująca komórki automatu w losowy sposób
CellularAutomation.prototype.initialize = function(){
    //tworzenie komórek na planszy
    var index = 0;
    for(var height=0; height<this.size; height++){
        for(var width=0; width<this.size; width++){
            //losujemy czy przy starcie bedzie martwa czy zywa
            var rand = Math.random()*10;
            var r,g,b,obramowanie;
            var tekst = "";
            if(rand<5){
                //nie żywa
                r=255.0;
                g=255.0;
                b=255.0;
                obramowanie = 1.0;
            }
            else{
                //żywa
                r = 0.0;
                g = 0.0;
                b = 0.0;
                obramowanie = 0.0;
            }
            var tabOfValues
            if(this.numberOfValues>5)
                tabOfValues = new Array(this.numberOfValues);
            else
                tabOfValues = new Array(5);
            tabOfValues[0]=r;
            tabOfValues[1]=g;
            tabOfValues[2]=b;
            tabOfValues[3]=obramowanie;
            tabOfValues[4]=tekst;
            for(var i=5; i<tabOfValues.length;i++){
                var numb = (Math.random()*100)/tabOfValues.length;
                tabOfValues[i]=numb.toFixed(2);
            }
            this.map[height][width] = new Cellular(index, height, width, this.numberOfValues, tabOfValues);
            index++;
        }
    }
};

//funkcja ładująca wygląd siatki z pliku. Parametry to pełen adres URL do pliku i automat komórkowy;
CellularAutomation.prototype.loadFromFile = function(fileUrl, automat){
    function setElements(arr){   //funkcja ustawiajaca elementy komorki z pliku. Parametr to mapa pobrana z pliku .JSON;
        automat.size = arr.length;
        automat.countOfCellulars=automat.size*automat.size;
        automat.map=new Array(automat.size);
        for(var i = 0; i < automat.size; i++){    //tablica dwuwymiarowa
            automat.map[i] = new Array(automat.size);
            for(var j = 0; j < automat.size; j++){
                automat.map[i][j]= new Cellular( arr[i][j].cellularID, arr[i][j].heightPosition, arr[i][j].widthPosition, arr[i][j].countOfValues, arr[i][j].values)  //ustawianie elementow do tablicy dwuwymiarowej
            }
        }
    }
    var request = new XMLHttpRequest();    				 //wczytywanie odbywa sie za pomoca XMLHttpRequest
    request.open("GET", fileUrl, false);
    request.send(null);
    if(request.status!=200)
        return false;
    var myArr = JSON.parse(request.responseText);		//parsowanie z pliku JSON
    setElements(myArr);
    return true;
};

//funkcja zapisująca wygląd siatki do pliku. Parametry to pełen adres URL do plik i siatka w postaci map. Zwraca informację o tym czy udało się zapisać plik.
CellularAutomation.prototype.saveToFile = function(fileUrl, object){
    var request = new XMLHttpRequest();
    request.open("PUT", fileUrl, false);
    var json = JSON.stringify(object);
    request.send(json);
    return request.status;
};

//funkcja przypisująca wartości do danej komórki. Po kolei pobiera: Id komórki, wiersz, kolumnę, ilość wartości w komórce i tablice wartości;
function Cellular(ID, heightPosition, widthPosition, countOfValues, values){
    this.cellularID = ID;
    this.heightPosition = heightPosition;
    this.widthPosition = widthPosition;
    this.countOfValues = countOfValues;
    this.values = new Array(countOfValues);
    this.values = values;
    this.actuallR = 0;
    this.actuallG = 1;
    this.actuallB = 2;
    this.actuallFrame = 3;
    this.actuallText = 4;
}
