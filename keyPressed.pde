void keyPressed() {
  //Void that is called whenever a key is pressed on the keyboard


  //Declares the variables for use in this void  
  String coordresult;
  int playerxfuture;
  int playeryfuture;


  if (!wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition())) {
    //Checks if the win condition isn't fulfilled


    if (newPlayer.getYPosition() > 0) {
      //Checks if the players position is lower than the windows top
      if (keyCode == UP || key == 'w') {
        //Checks if the Up arrow or the W key is pressed 

        playerimg = playerimgup;
        //Changes the player model to the UP version


        playerxfuture = newPlayer.getXPosition();
        playeryfuture = newPlayer.getYPosition()-50;        
        coordresult = playerxfuture+"/"+playeryfuture;
        //Gets the future position of the player


        if (!coordlistwall.hasValue(coordresult)) {
          newPlayer.setYPos(-50);
          //Moves the player up

          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getYPosition()-50 > -1 && !coordlistwall.hasValue(newBox.getXPosition()+"/"+(newBox.getYPosition()-50))) {        
              newBox.setYPos(-50);
              //Moves the box if the player moves into the space that box is in

              int index = 0;
              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
              //Updates the boxes position in memory
            } else {
              newPlayer.setYPos(+50);
              //Moves the player back if the box cannot be moved
            }
          }
        }
      }
    }

    if (newPlayer.getYPosition() < height-50) {
      //Checks if the players position is higher than the window bottom
      if (keyCode == DOWN || key == 's') {
        //Checks if the Down arrow or the S key is pressed

        playerimg = playerimgdown;
        //Changes the player model to the down version


        playerxfuture = newPlayer.getXPosition();
        playeryfuture = newPlayer.getYPosition()+50;
        coordresult = playerxfuture+"/"+playeryfuture;
        //Gets the future position of the player


        if (!coordlistwall.hasValue(coordresult)) {  
          newPlayer.setYPos(+50);
          //Moves the player down

          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getYPosition()+50 < height && !coordlistwall.hasValue(newBox.getXPosition()+"/"+(newBox.getYPosition()+50))) {        
              newBox.setYPos(+50);
              //Moves the box down


              int index = 0;
              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
              //Updates the boxes position in memory
            } else {
              newPlayer.setYPos(-50);
              //Moves the player back if the box cannot be moved
            }
          }
        }
      }
    }

    if (newPlayer.getXPosition() > 0) {
      //Checks if the players position is more than the windows left edge
      if (keyCode == LEFT || key == 'a') {    
        //Checks if the Left arrow or the A key is pressed

        playerimg = playerimgleft;
        //Changes the player model to the left version   


        playerxfuture = newPlayer.getXPosition()-50;
        playeryfuture = newPlayer.getYPosition();
        coordresult = playerxfuture+"/"+playeryfuture;
        //Gets the future position of the player


        if (!coordlistwall.hasValue(coordresult)) {
          newPlayer.setXPos(-50);
          //Moves the player left


          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getXPosition()-50 > -1 && !coordlistwall.hasValue((newBox.getXPosition()-50)+"/"+(newBox.getYPosition()))) {        
              newBox.setXPos(-50);
              //Moves the box left


              int index = 0;
              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
              //Updates the boxes position in memory
            } else {
              newPlayer.setXPos(+50);
              //Moves the player back if the box cannot be moved
            }
          }
        }
      }
    }

    if (newPlayer.getXPosition() < width-50) {
      //Checks if the players position is less than the windows right edge
      if (keyCode == RIGHT || key == 'd') {
        //Checks if the right arrow or the D key is pressed

        playerimg = playerimgright;
        //Changes the player model to the right version   


        playerxfuture = newPlayer.getXPosition()+50;
        playeryfuture = newPlayer.getYPosition();
        coordresult = playerxfuture+"/"+playeryfuture;
        //Gets the future position of the player


        if (!coordlistwall.hasValue(coordresult)) {
          newPlayer.setXPos(+50);      
          //Moves the player right


          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getXPosition()+50 < width && !coordlistwall.hasValue((newBox.getXPosition()+50)+"/"+(newBox.getYPosition()))) {        
              newBox.setXPos(+50);
              //Moves the box right


              int index = 0;
              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
              //Updates the boxes position in memory
            } else {
              newPlayer.setXPos(-50);
              //Moves the player back if the box cannot be moved
            }
          }
        }
      }
    }
  }
}