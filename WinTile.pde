//This tab contains an example of inheritance on line 2

class WinTile extends Tile {
  private int xpos;
  private int ypos;
  private int xsize;
  private int ysize;
  private color tilecolor;

  //Declares the WinTile class using values from the Tile Class 
  WinTile(int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new win tile object is called

    super(newXPosition, newYPosition, newWidth, newHeight, newcolor);
    //Draws a new WinTile using these values

    wintiles.append(newXPosition + "/" + newYPosition);
    //Adds the wintile's position to memory
    
    xpos = newXPosition;
    ypos = newYPosition;
    xsize = newWidth;
    ysize = newHeight;
    tilecolor = newcolor;
    //Assigns the Wintiles values to local variables
  }

  void display() {
    PImage tileimg;  //Declares an image for the wintile
    tileimg = loadImage("tile.png");  //Loads the image for the wintile
    fill(tilecolor);    
    image(tileimg, xpos, ypos, xsize, ysize);
    //Renders the wintile
  }
}

void Win() {  
  fill(0);
  PFont font = loadFont("OCRAExtended-48.vlw"); //Declares and loads a font
  
  
  textAlign(CENTER);
  stroke(0);
  strokeWeight(2);
  textSize(30);
  textFont(font);
  fill(0);
  //Defines the color, size and alignment for the on-screen text
  
  text("GAME OVER", width/2, height/2-height/8);
  textSize(20);
  text("Press Q to quit", width/2, height/2+height/8);
  //Writes text on screen to indicate the game is over 
  
  
  if (keyPressed && key == 'q') {
    //if (wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition()) && key == 'q') {
    exit();
    //Exits the program if Q key is entered
  }
}