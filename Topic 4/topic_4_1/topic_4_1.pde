//Felipe Ramires & Hans Nielen
//Topic 4 particles
//Assignment 4.1
Firework firework;                //initiate objects and variables
ParticleSystem [] particlesystem;
int systemCount;
int systemAmount;

void setup() {
  size(1000, 600);                //canvas size
  systemCount = 0;                //give initial values to variables
  systemAmount = 4;
  firework = new Firework(width, height);  //create object
  particlesystem = new ParticleSystem[systemAmount];  //create object array
  for (int i = 0; i<systemAmount; i++){               //create the objects within array
  particlesystem[i] = new ParticleSystem();

  }
}

void draw() {
  background(40, 1, 55);    //background
  firework.update();        //firework update and render
  firework.render();
  
  if (firework.explosion()) {  //checks if firework has exploded, starts explosion
    particlesystem[systemCount].begin(firework.position(),firework.size());    
    firework = new Firework(width, height);  //new firework 
    systemCount++;                           //variable increases for object array
    if (systemCount>=systemAmount-1){        //variable resets
     systemCount = 0; 
    }
  }
  for(int i=0;i<systemAmount;i++){  //for loop for updating and rendering object array
  particlesystem[i].update();
  particlesystem[i].render();
  }
}
