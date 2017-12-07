function CellularAutomation(size)
{
    this.size = size;
    this.countOfCellulars = size*size;
    this.map = new Array(size);

    //tablica dwuwymiarowa
    for(var i=0; i<this.size; i++)
    {
        this.map[i] = new Array(size);
    }
}

//NOWA GRA
CellularAutomation.prototype.initialize = function()
{
    //tworzenie komórek na planszy
    var index = 0;
    for(var height=0; height<this.size; height++)
    {
        for(var width=0; width<this.size; width++)
        {
            //losujemy czy przy starcie bedzie martwa czy zywa
            var rand = Math.random()*10;
            var isLive;
            var r,g,b;
            if(rand<5)
            {
                isLive = false; //nie zywa
                r=0.0;
                g=0.0;
                b=0.0;
            }
            else
            {
                isLive = true; //zywa
                r = Math.random();
                g = Math.random();
                b = Math.random();
            }
            //losujemy wartosci komorek
            var tabOfValues = new Array(r,g,b); //randomowe wartosci rgb do dla komórki
            this.map[height][width] = new Cellular(index, height, width,3, tabOfValues) //true or false zaleznie czy zyje czy nie
            index++;     
        }
    }

};

CellularAutomation.prototype.loadFromFile = function()
{

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
