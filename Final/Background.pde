class Background {

  int x=0;                  //set global variables
  float xoff, start=0.0;
  float xincrement=0.01;
  int xSize, ySize;
  boolean moveLeft, moveRight;


  Background(int wit, int heit) {
    xSize = wit;
    ySize = heit;
  }

  void Display() {
    noStroke();
    fill(0, 255, 0); 
    beginShape();             //start shape for background terrain
    xoff = start;  
    move();


    for (x=0; x<=xSize; x++) {                  //set coordinates for the entire screen
      vertex(x, ySize/2.5+(noise(xoff)*200));  //use noise function to create terrain visual
      xoff += xincrement;
    } 

    vertex(xSize, ySize);          //bottom parts of background terrain shape
    vertex(0, ySize); 
    endShape();
  }

  void moveCheck(char b) {      // if user presses a --> bakcground moves in that direction
    if ( b == 'a') {
      moveRight = true;  
    }  
    if ( b == 'd') {          // if user presses d --> bakcground moves in that direction
      moveLeft = true;
  
    }
  }

  void haltCheck(char b) {    // when key is released, movement boolean is set to false
    if (b == 'a') {
      moveRight = false;
    }  
    if (b == 'd') {
      moveLeft = false;
    }
  }

  void move() {          // background moves left or right depending on the boolean called
    if (moveRight) {
      start += 2*xincrement;
    }
    if (moveLeft) {
      start -= 2*xincrement;
    }
  }
}
