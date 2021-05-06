  int x=0;
  float xoff,start=0.0;
  float xincrement=0.01;
void setup(){
  size(800, 200);
  background(0);
  noStroke();
}

void draw(){
  background(0);
  noStroke();
  fill(0,255,0);
  rect(0,100,800,100);
  fill(200,200,200);
  rect(0,125,800,50);
  fill(255,0,0);
  rect(width/2, 150, 30,10);
  stroke(0,255,0);  
  for(x=0;x<=width;x++){
  line(x, 100, x, 100-(noise(xoff)*75));
  xoff += xincrement;
  }
  start += xincrement;
  
  
  
}
