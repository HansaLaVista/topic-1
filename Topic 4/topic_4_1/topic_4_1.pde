//Felipe Ramires & Hans Nielen
//Topic 4 particles
//Assignment 4.1
Firework firework;
ParticleSystem particlesystem;

void setup() {
  size(1000, 600);
  firework = new Firework(width, height);
  particlesystem = new ParticleSystem();
}

void draw() {
  background(40, 1, 55);
  firework.update();
  firework.render();
  if (firework.explosion()) {
    particlesystem.begin(firework.position(),firework.size());    
    firework = new Firework(width, height);    

  }
  particlesystem.update();
  particlesystem.render();
}
