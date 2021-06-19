
//Felipe Ramires & Hans Nielen
//Topic 3 Forces
//Assignment 3.2

PVector start;       // starting positon vector
int amount = 100;             //set amount of massdamper systems
int systemCount;              //counter for particle systems
int systemAmount;             //max mparticle systems

Meteor meteor;                //initiate objects and variables
ParticleSystem [] particlesystem;   //particle system array
Background background;              //background
Menu menu;                          //menu
MassDamper [] tentacles ;           //initiate massdamper array
Projectile bullet;                  // calling class Projectile
Tank tank;                          // calling class Tank


void setup() {
  size(1300, 750);
  start = new PVector(150, .8*height); // giving values for the starting position 
  background(50, 120, 78);             //background colour  
  bullet = new Projectile(start, width, height);  // bullet and tank have same starting position + creating new object bullet and tank
  tank = new Tank(start, bullet);
  tentacles = new MassDamper [amount];            //initiate array
  background = new Background(width, height);     //initiate background and objects in array
  for (int i = 0; i<amount; i++) {
    tentacles[i] = new MassDamper((random(0, width)), height);
  }
  systemCount = 0;                //give initial values to variables
  systemAmount = 4;
  meteor = new Meteor(width, bullet);  //create object
  particlesystem = new ParticleSystem[systemAmount];  //create object array
  for (int i = 0; i<systemAmount; i++) {               //create the objects within array
    particlesystem[i] = new ParticleSystem();
  }
  menu = new Menu(width, height);    //creating menu
}

void draw() {           // displaying background, bullet, tentacles, menu, meteor, tank and the projectile
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
  meteor.update();        //meteor update, render and collision detection
  meteor.render();
  meteor.collide();
  if (meteor.boom || meteor.meteorPos.y > 1.2*height) {  //checks if meteor has exploded, starts explosion
    menu.update(meteor.boom);              //update score in menu
    meteor = new Meteor(width, bullet);  //new meteor 
    systemCount++;                           //variable increases for object array
    if (systemCount>=systemAmount-1) {        //variable resets
      systemCount = 0;
    }
  }
  for (int i=0; i<systemAmount; i++) {  //for loop for updating and rendering object array
    particlesystem[i].update();
    particlesystem[i].render();
  }
  menu.display();          //display menu, 
}

void keyPressed() {
  char pressedKey = key;                  //if key is pressed, pass the value on to objects that have direct interaction
  tank.actionCheck(pressedKey);
  background.moveCheck(pressedKey);
  for (int i=0; i<amount; i++) {
    tentacles[i].moveCheck(pressedKey);
  }
}

void keyReleased() {                      //if key released, pass the value on to object that have direct interaction 
  char releasedKey = key;
  tank.haltCheck(releasedKey);
  background.haltCheck(releasedKey);
  for (int i=0; i<amount; i++) {
    tentacles[i].haltCheck(releasedKey);
  }
}
