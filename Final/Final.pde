
//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start;       // starting positon vector
Projectile bullet;          // calling class Projectile
Tank tank;   // calling class Tank
boolean dragging = false; // boolean for checking dragging

MassDamper [] tentacles ;
int amount = 100;

Meteor meteor;                //initiate objects and variables
ParticleSystem [] particlesystem;
int systemCount;
int systemAmount;

Background background;
Menu menu;

void setup() {
  size(1300, 750);
  start = new PVector(150, .8*height); // giving values for the starting position 
  background(50, 120, 78);

  bullet = new Projectile(start, width, height);  // bullet and tank have same starting position + creating new object bullet and tank
  tank = new Tank(start, bullet);

  tentacles = new MassDamper [amount];
  background = new Background(width, height);

  for (int i = 0; i<amount; i++) {
    tentacles[i] = new MassDamper((random(0, width)), height);
  }

  systemCount = 0;                //give initial values to variables
  systemAmount = 4;
  meteor = new Meteor(width, height, bullet);  //create object
  particlesystem = new ParticleSystem[systemAmount];  //create object array
  for (int i = 0; i<systemAmount; i++) {               //create the objects within array
    particlesystem[i] = new ParticleSystem();
  }
  menu = new Menu(width, height);
}

void draw() {           // displaying background, bullet and tank
  background(251, 204, 209);
  background.Display();
  bullet.ProjectileUpdate(tank.position());
  bullet.ProjectileDisplay(); 
  tank.Display();
  tank.Update();
  for (int i = 0; i <amount; i++) {
    tentacles[i].render();
    tentacles[i].update();
  }
  meteor.update();        //meteor update and render
  meteor.render();
  meteor.collide();
  if (meteor.explosion() || meteor.meteorPos.y > 1.2*height) {  //checks if meteor has exploded, starts explosion
    menu.update(meteor.explosion());
    meteor = new Meteor(width, height, bullet);  //new meteor 
    systemCount++;                           //variable increases for object array
    if (systemCount>=systemAmount-1) {        //variable resets
      systemCount = 0;
    }
  }
  for (int i=0; i<systemAmount; i++) {  //for loop for updating and rendering object array
    particlesystem[i].update();
    particlesystem[i].render();
  }
  menu.display(meteor.boom);
}

void mouseDragged() {              
  PVector bulletpos = bullet.callPos();
  boolean shot = bullet.callShot();
  if ((sqrt(pow(mouseX-bulletpos.x, 2)+pow(mouseY-bulletpos.y, 2)) <= 25 || dragging)&& !shot) { // checking if the mouse is wihtin the bullet's diameter or if the user is dragging, and the bullet is not shot
    tank.Dragged(mouseX, mouseY); // give the bullet's position to mouseX and mouseY
    dragging=true; // checking for dragging
  }
}

void mouseReleased() { 
  if (dragging) {
    dragging = false; // user is not dragging so the bullet can be released
  }
}

void keyPressed() {
  char pressedKey = key;
  tank.actionCheck(pressedKey);
  background.moveCheck(pressedKey);
  for (int i=0; i<amount; i++) {
    tentacles[i].moveCheck(pressedKey);
  }
}

void keyReleased() {
  char releasedKey = key;
  tank.haltCheck(releasedKey);
  background.haltCheck(releasedKey);
  for (int i=0; i<amount; i++) {
    tentacles[i].haltCheck(releasedKey);
  }
}
