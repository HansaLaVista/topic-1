//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.1

PVector start;  // initial position of the ball
PVector startSpeed; // initial speed of the ball
Ball ball;          
void setup(){
  size(1000,500);
  start = new PVector(100, height/2); // give a value to the initial position of the ball
  startSpeed = new PVector(8,-8);    // give a value to the initial speed of the ball
  background(50,120,78);
  ball = new Ball(start,startSpeed); 
}

void draw(){           // display the ball and update
 background(50,120,78);
 ball.ballDisplay();
 ball.ballUpdate();
}
