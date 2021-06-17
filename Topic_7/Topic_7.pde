<<<<<<< Updated upstream
//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start;       // starting positon vector
Ball ball;          // calling class Ball
Catapult catapult;   // calling class Catapult
Wall wall;
boolean dragging = false; // boolean for checking dragging

void setup(){
  size(1500,750);
  start = new PVector(150, 4*height/5); // giving values for the starting position 
  background(50,120,78);

  ball = new Ball(start, width ,height);  // ball and catapult have same starting position + creating new object ball and catapult
  wall = new Wall(width, height, ball);  
  catapult = new Catapult(start, ball);
}

void draw(){           // displaying background, ball and catapult
 background(50,120,78);

 ball.ballUpdate();
 ball.ballDisplay(); 
 wall.update();
 wall.display(); 
 
 catapult.Display();
}

void mouseDragged(){              
  PVector ballpos = ball.callPos();
  boolean shot = ball.callShot();
  if((sqrt(pow(mouseX-ballpos.x,2)+pow(mouseY-ballpos.y,2)) <= 25 || dragging)&& !shot){ // checking if the mouse is wihtin the ball's diameter or if the user is dragging, and the ball is not shot
  catapult.Dragged(mouseX, mouseY); // give the ball's position to mouseX and mouseY
  dragging=true; // checking for dragging
  }
}

void mouseReleased(){ 
  if (dragging){
    catapult.Released(); // catapult will release ball
    dragging = false; // user is not dragging so the ball can be released
  }
}
=======

//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start;       // starting positon vector
Ball ball;          // calling class Ball
Catapult catapult;   // calling class Catapult
Wall wall;            
boolean dragging = false; // boolean for checking dragging

void setup(){
  size(1000,500);
  start = new PVector(100, 4*height/5); // giving values for the starting position 
  background(50,120,78);

  ball = new Ball(start);  // ball and catapult have same starting position + creating new object ball and catapult
  wall = new Wall(width, height, ball);  
  catapult = new Catapult(start, ball);
}

void draw(){           // displaying background, ball and catapult
 background(50,120,78);

 ball.ballUpdate();
 ball.ballDisplay(); 
 wall.update();
 wall.display(); 
 
 catapult.Display();
}

void mouseDragged(){              
  PVector ballpos = ball.callPos();
  boolean shot = ball.callShot();
  if((sqrt(pow(mouseX-ballpos.x,2)+pow(mouseY-ballpos.y,2)) <= 25 || dragging)&& !shot){ // checking if the mouse is wihtin the ball's diameter or if the user is dragging, and the ball is not shot
  catapult.Dragged(mouseX, mouseY); // give the ball's position to mouseX and mouseY
  dragging=true; // checking for dragging
  }
}

void mouseReleased(){ 
  if (dragging){
    catapult.Released(); // catapult will release ball
    dragging = false; // user is not dragging so the ball can be released
  }
}
>>>>>>> Stashed changes
