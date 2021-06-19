
//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start;       // starting positon vector
Ball ball;          // calling class Ball
Catapult catapult;   // calling class Catapult
boolean dragging = false; // boolean for checking dragging

MassDamper [] grass ;
int amount = 100;

Firework firework;                //initiate objects and variables
ParticleSystem [] particlesystem;
int systemCount;
int systemAmount;

Background background;

void setup() {
  size(1300, 750);
  start = new PVector(150, .9*height); // giving values for the starting position 
  background(50, 120, 78);

  ball = new Ball(start, width, height);  // ball and catapult have same starting position + creating new object ball and catapult
  catapult = new Catapult(start, ball);

  grass = new MassDamper [amount];
  background = new Background(width, height);

  for (int i = 0; i<amount; i++) {
    grass[i] = new MassDamper((random(0, width)), height);
  }

  systemCount = 0;                //give initial values to variables
  systemAmount = 4;
  firework = new Firework(width, height,ball);  //create object
  particlesystem = new ParticleSystem[systemAmount];  //create object array
  for (int i = 0; i<systemAmount; i++) {               //create the objects within array
    particlesystem[i] = new ParticleSystem();
  }
}

void draw() {           // displaying background, ball and catapult
  background(10, 10, 44);
  background.Display();
  ball.ballUpdate(catapult.position());
  ball.ballDisplay(); 
  catapult.Display();
  catapult.Update();
  for (int i = 0; i <amount; i++) {
    grass[i].render();
    grass[i].update();
  }
  firework.update();        //firework update and render
  firework.render();
  firework.collide();
  if (firework.explosion() || firework.meteorPos.y > 1.2*height) {  //checks if firework has exploded, starts explosion 
    firework = new Firework(width, height, ball);  //new firework 
    systemCount++;                           //variable increases for object array
    if (systemCount>=systemAmount-1) {        //variable resets
      systemCount = 0;
    }
  }
  for (int i=0; i<systemAmount; i++) {  //for loop for updating and rendering object array
    particlesystem[i].update();
    particlesystem[i].render();
  }
}

void mouseDragged() {              
  PVector ballpos = ball.callPos();
  boolean shot = ball.callShot();
  if ((sqrt(pow(mouseX-ballpos.x, 2)+pow(mouseY-ballpos.y, 2)) <= 25 || dragging)&& !shot) { // checking if the mouse is wihtin the ball's diameter or if the user is dragging, and the ball is not shot
    catapult.Dragged(mouseX, mouseY); // give the ball's position to mouseX and mouseY
    dragging=true; // checking for dragging
  }
}

void mouseReleased() { 
  if (dragging) {
    dragging = false; // user is not dragging so the ball can be released
  }
}

void keyPressed() {
  char pressedKey = key;
  catapult.actionCheck(pressedKey);
 background.moveCheck(pressedKey);
 for(int i=0; i<amount; i++){
 grass[i].moveCheck(pressedKey); 
 }
}

void keyReleased() {
  char releasedKey = key;
  catapult.haltCheck(releasedKey);
  background.haltCheck(releasedKey);
 for(int i=0; i<amount; i++){
 grass[i].haltCheck(releasedKey); 
 }  
}
