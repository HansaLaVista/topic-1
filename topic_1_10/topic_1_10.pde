
redDot[] RedDot = new redDot[500];


void setup() {

  size(400, 400);


  for (int i = 0; i < RedDot.length; i++) {

    RedDot[i] = new redDot();
  }
}


void draw(){
  
  background(255);
  
   for (int i = 0; i < RedDot.length; i++) {

    RedDot[i].redDotDisplay();
  }
  
}
