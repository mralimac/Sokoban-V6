//This tab contains an example of Aggregation relating to MapObject Arraylist and MapObjectX  //<>//
//The classes are examples of high cohesion as they do not effect each other despite what happens inside them
//The classes are also examples of Abstraction, encapsulation and information-hiding given the data and methods contained within them
//The player, walls, boxes and wintiles are examples of Association. They are related to each other and can interact (player pushes box) but they also independent of each other. A wall could be deleted and the game won't change at all
//.display() of the classes are examples of polymorphism
//The functions in "functions" tab have examples of parameter passing
//The functions are examples of Attributes and methods
//The classes are Objects and classes


//These globals variables are needed here as they are referenced throughout the program
ArrayList<Floor> FloorList;  //Declares an ArrayList for storing the ground/floor
ArrayList<MapObject> arraylistofwalls; //Declares an ArrayList for storing the walls
StringList coordlistwall; //Functions as the collsion memory for the walls
StringList boxcoord; //Functions as the collsion memory for the box
StringList wintiles; //Functions as the memory for the win tile

//This PImages are here because if they are local, they'll lag the program badly
//However they can be local values. I just choose not to at this current time
PImage floorimg; 
PImage playerimg;
PImage playerimgleft;
PImage playerimgup; 
PImage playerimgright;      
PImage playerimgdown;

//Declares the values for classes
Player newPlayer;  //Declares a player object for the player class
Box newBox;  //Declares a box object for the box class
Tile newTile; //Declares a tile object for the tile class
WinTile WinTile; //Declares a winner tile for the wintile class

//This void is to read the size of the level and adjust the size of the window accordingly   
void settings() {
  //This function can be found in the "functions" tab
  String[] leveltile = getlevelfile();
  int windowsizex = getwindowx(leveltile);
  int windowsizey = getwindowy(leveltile);
  size(windowsizex, windowsizey);
}

void setup() {
  String[] leveltile = getlevelfile(); //Calls the function that loads the level file. Outputs to a String Array
  String totalline = linecondensor(leveltile); //Collapses the string array to a singleline for loading

  //The following variables are initalized with 0. However this is changed depending on what the level file reads
  int MapObjectx = 0;  //Declares a variable for the X Coord of Map Objects
  int MapObjecty = 0;  //Declares a variable for the Y Coord of Map Objects
  int Playerx = 0;  //Declares and initalises the Players X Position
  int Playery = 0;  //Declares and initalises the Players Y Position

  arraylistofwalls = new ArrayList<MapObject>();
  FloorList = new ArrayList<Floor>();
  wintiles = new StringList();
  coordlistwall = new StringList();
  boxcoord = new StringList();
  //Initalising the Lists




  //This is contained within a try/catch to be more graceful with errors
  try {
    floorimg = loadImage("floor.jpeg");
    //This is the floor texture
    playerimg = loadImage("player-up.png");
    //This is the default playermodel


    //These are the other player models
    playerimgup = loadImage("player-up.png");
    playerimgleft = loadImage("player-left.png");  
    playerimgdown = loadImage("player-down.png");
    playerimgright = loadImage("player-right.png");
  }
  catch(NullPointerException i) {
    //This catches errors if the file is not found
    println("No File Found");
    //Writes in console that the file is missing
    fill(0);
    //Changes the color to black
    textSize(60);
    //Changes the text size to 60
    textAlign(CENTER);
    //Aligns the text to center
    text("FILE MISSING", width/2, height/2-50);
    //Writes text to the center top of the screen
    textSize(40);
    //Changes the text size to 40
    text("Please Close the Program", width/2, height/2+50);
    //Writes text to the center bottom of the screen
    stop();
    //Stops the programs from executing anymore code
  }

  try {
    //Starts a try for the file load, goes to catch if it fails  
    String[] pieces = (split(totalline, ','));  
    //Declares String Array and fills it with the split ground array. Spilting it by comma 

    for ( int tileindex = 0; tileindex < pieces.length; tileindex++) {
      //Starts a for loops for the map objects


      String MapObjectTile = "w";
      String WinTileChar = "d";
      String PlayerChar = "p";
      String BoxChar = "b";
      //Declare and initalize the characters that the program checks the level file for


      FloorList.add(new Floor(MapObjectx, MapObjecty, 50, 50, color(100, 100, 100)));
      //Adds a floor tile

      if (pieces[tileindex].equals(MapObjectTile) == true) {
        PVector wallpos;
        wallpos = new PVector(MapObjectx, MapObjecty);
        if (wallpos.x != 0) {
          arraylistofwalls.add(new MapObject(wallpos, 50, 50, color(255, 200, 50)));
        } else {
          arraylistofwalls.add(new MapObject(MapObjectx, MapObjecty, 50, 50, color(255, 200, 50)));
        }
        //If this is true, a wall is added
      }             


      if (pieces[tileindex].equals(WinTileChar) == true) {
        WinTile = new WinTile(MapObjectx, MapObjecty, 50, 50, color(78, 145, 12));
        //If this is true, a wintile is added
      }


      if (pieces[tileindex].equals(PlayerChar) == true) {
        Playerx = MapObjectx;
        Playery = MapObjecty;        
        newPlayer = new Player(Playerx, Playery, 50, 50, color(255, 0, 0));
        //If this is true, the player is added
      }
      if (pieces[tileindex].equals(BoxChar) == true) {
        newBox = new Box(MapObjectx, MapObjecty, 50, 50, color(0, 0, 255));
        //If this is true, a box is added
      }

      MapObjectx = MapObjectx+50;
      if (MapObjectx == width) {
        MapObjectx = 0;
        MapObjecty = MapObjecty+50;
      }
      //If the mapobjects exceed the map boundaries then it goes back to the start on a new line
    }
  }

  //Catches the errors
  catch (NullPointerException errorLoadingRectanglePositionsInSetup) {
    //This catches errors if the level file is incorrect
    println("File Incorrect");
    //Writes in console that the file is incorrect
    fill(0);
    //Changes the color to black
    textSize(60);
    //Changes the text size to 60
    textAlign(CENTER);
    //Aligns the text to center
    text("Incorrect File", width/2, height/2-50);
    //Writes text to the center top of the screen
    textSize(40);
    //Changes the text size to 40
    text("Please Close the Program", width/2, height/2+50);
    //Writes text to the center bottom of the screen
    stop();
    //Stops the programs from executing anymore code
  }
}

void draw() {
  background(0); 
  //Puts a black background to refresh all the on-screen elements every frame
  for (int i =0; i < FloorList.size(); i++) {
    //Starts a for loop to display all the floor tiles
    Floor FloorInOurList = (Floor) FloorList.get(i);
    //Gets the floor object at a certain index and assigns it to the class variable
    FloorInOurList.display();
    //Calls the void inside the floor class to display/update the floor tile
  }

  for (int index = 0; index<arraylistofwalls.size(); index++) {
    MapObject referenceObject = (MapObject)arraylistofwalls.get(index);
    referenceObject.display();
    //Renders all the walls in the game
  }

  newBox.display();
  //Renders the box
  WinTile.display();
  //Renders the wintile
  newPlayer.display();  
  //Renders the player
  if (keyPressed && key == 'o' || wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition())) {
    Win();
    //The win condition. A keypress was added for debugging/testing purposes
  }
}