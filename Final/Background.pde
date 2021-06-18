class Background{
  
  int x=0;                  //set global variables
float xoff, start=0.0;
float xincrement=0.01;
int xSize,ySize;
boolean moveLeft, moveRight;
  
  
  Background(int wit, int heit){
    xSize = wit;
    ySize = heit;
    
  }
  
 void Display(){
   noStroke();
  fill(0, 255, 0); 
  beginShape();             //start shape for background terrain
  xoff = start;  
  move();


  for (x=0; x<=xSize; x++) {    //set coordinates for the entire screen
    vertex(x, ySize/3+(noise(xoff)*200));  //use noise function to create terrain visual
    xoff += xincrement; 
  } 

  vertex(xSize, ySize);          //bottom parts of background terrain shape
  vertex(0, ySize); 
  endShape();
    
 }
    
void moveCheck(char b){  
  if( b == 'a'){
    moveRight = true;
    //start += 2*xincrement; 
  }  
   if( b == 'd'){
    moveLeft = true;
    //start -= 2*xincrement;
  }  
}

void haltCheck(char b){
  if (b == 'a'){
    moveRight = false;
  }  
  if (b == 'd'){
    moveLeft = false;
  }
}

void move(){
  if (moveRight){
    start += 2*xincrement; 
  }
  if (moveLeft){
   start -= 2*xincrement;  
  }
}
  
  
}
