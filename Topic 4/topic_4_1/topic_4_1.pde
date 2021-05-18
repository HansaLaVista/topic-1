//Felipe Ramires & Hans Nielen
//Topic 4 particles
//Assignment 4.1
Firework firework;
ParticleSystem [] particlesystem;
int systemCount;

void setup() {
  size(1000, 600);
  systemCount = 0;
  firework = new Firework(width, height);
  particlesystem = new ParticleSystem[3];
  for (int i = 0; i<3; i++){
  particlesystem[i] = new ParticleSystem();
  }
}

void draw() {
  background(40, 1, 55);
  firework.update();
  firework.render();
  if (firework.explosion()) {
    particlesystem[systemCount].begin(firework.position(),firework.size());    
    firework = new Firework(width, height);    
    systemCount++;
    if (systemCount>2){
     systemCount = 0; 
    }
  }
  for(int i=0;i<3;i++){
  particlesystem[i].update();
  particlesystem[i].render();
  }
}
