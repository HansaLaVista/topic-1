  int x=0;                  //set global variables
  float xoff,start=0.0;
  float xincrement=0.005;
void setup(){
  size(800, 200);            //set size, stroke and framerate
  noStroke();
  frameRate(20);
}

void draw(){
  background(0);            //set standard shapes and colors for scene
  fill(0,255,0);
  rect(0,100,800,100);
  fill(200,200,200);
  rect(0,125,800,50);
  fill(255,0,0);
  rect(width/2, 150, 30,10);
  fill(0,255,0); 
  beginShape();             //start shape for background terrain
  for(x=0;x<=width;x++){    //set coordinates for the entire screen
  vertex(x, 100-(noise(xoff)*75));  //use noise function to create terrain visual
  xoff += xincrement;      //move forward in noise domain
  }
  vertex(800,100);          //bottom parts of background terrain shape
  vertex(0,100); 
  endShape();  
}
