//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start; 
Ball ball;
Catapult catapult;
boolean dragging = false;

void setup(){
  size(1000,500);
  start = new PVector(100, 4*height/5);
  background(50,120,78);
  ball = new Ball(start);
  catapult = new Catapult(start, ball);
}

void draw(){
 background(50,120,78);
 ball.ballDisplay();
 ball.ballUpdate();
 catapult.Display();
}

void mouseDragged(){
  PVector ballpos = ball.callPos();
  boolean shot = ball.callShot();
  if((sqrt(pow(mouseX-ballpos.x,2)+pow(mouseY-ballpos.y,2)) <= 25 || dragging)&& !shot){
  catapult.Dragged(mouseX, mouseY);
  dragging=true;
  }
}

void mouseReleased(){
  if (dragging){
    catapult.Released();
    dragging = false;
  }
}
