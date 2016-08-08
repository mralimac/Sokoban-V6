//This tab contains various functions that program references

//This function collapses a String array to a single line
String linecondensor(String[] ground) {
  String finalvalue ="";
  for (int i = 0; i < ground.length; i++) {
    finalvalue += ground[i] + "";
  }
  return finalvalue;
}


//This function uses the width of the string array to set a window size X in Settings()
//This allows for a level file to be of different sizes
int getwindowx(String[] ground) {
  int finalvalue = 0;     
  finalvalue = ground[0].length();  
  return finalvalue*50/2;
}

//This function uses the height of the string array to set a window size Y in Settings()
//This allows for a level file to be of different sizes
int getwindowy(String[] ground) {  
  int finalvalue = ground.length;
  return finalvalue*50;
}

//This functions loads the level file
String[] getlevelfile(){
 String[] configfile = loadStrings("config.txt");
  String levelfile = configfile[2];
 String[] finalvalue = loadStrings(levelfile);
 return finalvalue;
}