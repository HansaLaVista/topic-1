//Felipe Ramires & Hans Nielen
//Topic 6 Mass-spring-damper system
//assignment 6.1
MassDamper Flower;

void setup(){
  size(700,350);
  Flower =  new MassDamper(width, height);
}

void draw(){
  background(100,100,255);
  fill(100,255,100);
  noStroke();
  rect(0, height*0.75, width, height/4);
  Flower.render();
  Flower.update();
}
