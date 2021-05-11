//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start; 
PVector startSpeed;
Ball ball;
Catapult catapult;

void setup(){
  size(1000,500);
  start = new PVector(100, height/2);
  startSpeed = new PVector(8,-8);
  background(50,120,78);
  ball = new Ball(start,startSpeed);
  catapult = new Catapult(start, ball);
}

void draw(){
 background(50,120,78);
 ball.ballDisplay();
 ball.ballUpdate();
 catapult.Display();
}
