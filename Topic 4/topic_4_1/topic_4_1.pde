//Felipe Ramires & Hans Nielen
//Topic 4 particles
//Assignment 4.1
Firework firework;
ParticleSystem [] particlesystem;
int systemCount;
int systemAmount;

void setup() {
  size(1000, 600);
  systemCount = 0;
  systemAmount = 4;
  firework = new Firework(width, height);
  particlesystem = new ParticleSystem[systemAmount];
  for (int i = 0; i<systemAmount; i++){
  particlesystem[i] = new ParticleSystem();

  }
    particlesystem[systemAmount-1].begin(firework.position(),firework.size(),systemAmount);
}

void draw() {
  background(40, 1, 55);
  firework.update();
  firework.render();
  if (firework.explosion()) {
    particlesystem[systemCount].begin(firework.position(),firework.size());    
    firework = new Firework(width, height);    
    systemCount++;
    if (systemCount>=systemAmount-1){
     systemCount = 0; 
    }
    particlesystem[systemAmount-1].begin(firework.position(),firework.size(),systemAmount);
  }
  for(int i=0;i<systemAmount;i++){
  particlesystem[i].update();
  particlesystem[i].render();
  }
}
