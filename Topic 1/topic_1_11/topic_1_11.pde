// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021
// the pink confetti example from module 1 for Algorithms topic 1
// Angelika Mader - April 2020

// confetties are created by mouse click

Confetties confetties; 

void setup(){
  size(500,500);
  confetties = new Confetties();
}

void draw(){
  background(0);
  confetties.update();
  confetties.render();
}

void mousePressed(){        
  confetties.mousePressedEvent();
}
