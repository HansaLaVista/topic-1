//Felipe Ramires & Hans Nielen
//Topic 4 particles
//Assignment 4.1
Firework firework;

void setup(){
  size(1000,600);
  firework = new Firework(width,height);
}

void draw(){
  background(40,1,55);
  firework.update();
  firework.render();
}
