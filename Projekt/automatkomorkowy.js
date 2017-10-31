function CellularAutomation(size)
{
    this.size = size;
    this.countOfCellulars = size*size;
    this.map = new Array(size);

    //tablica dwuwymiarowa
    for(var i=0; i<size; i++)
    {
        this.map[i] = new Array(size);
    }
}

//NOWA GRA
CellularAutomation.prototype.initialize = function()
{
    //tworzenie komórek na planszy
    var index = 0;
    for(var height=0; height<size; height++)
    {
        for(var width=0; width<size; width++)
        {
            //losujemy czy przy starcie bedzie martwa czy zywa
            var rand = Math.random()*10;
            var isLive;
            if(rand<5)
            {
                isLive = false; //nie zywa
            }
            else
            {
                isLive = true; //zywa
            }

            this.map[height][width] = new Cellular(index, height, width, isLive) //true or false zaleznie czy zyje czy nie
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

CellularAutomation.prototype.nextStep = function()
{

};

function Cellular(ID, heightPosition, widthPosition,isLive)
{
    this.cellularID = ID;
    this.heightPosition = heightPosition;
    this.widthPosition = widthPosition;
    this.isLive = isLive;
}
