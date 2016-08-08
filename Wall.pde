//This tab contains an example of method overloading on lines 13 & 29


class MapObject {
  //Declares the MapObject class using values from the Tile Class 
  private int xpos;
  private int ypos;
  private int xsize;
  private int ysize;
  private color colour;
  private String coordstring;
  PVector position;
  MapObject(int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new map object is called    

    //super(newXPosition, newYPosition, newWidth, newHeight, newcolor);
    coordstring = newXPosition+"/"+newYPosition;
    coordlistwall.append(coordstring);
    //Adds the walls position to memory 


    xpos = newXPosition;
    ypos = newYPosition;
    xsize = newWidth;
    ysize = newHeight;
    colour = newcolor;
    //Assigns the values from MapObject to local variables
  }
  MapObject(PVector newposition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new map object is called     
    int newpositionx = int(newposition.x);
    int newpositiony = int(newposition.y);

    coordstring = newpositionx+"/"+newpositiony;
    coordlistwall.append(coordstring);
    //Adds the walls position to memory 


    xpos = newpositionx;    
    ypos = newpositiony;
    xsize = newWidth;
    ysize = newHeight;
    colour = newcolor;
    //Assigns the values from MapObject to local variables
  }

  void display() {
    PImage wallimage = loadImage("wall.png");
    image(wallimage, xpos, ypos, xsize, ysize);
    //Declares, loads and render the image for walls
  }
}