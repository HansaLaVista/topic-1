
redDot[] RedDot = new redDot[1000];


void setup() {

  size(400, 400);


  for (int i = 0; i < RedDot.length; i++) {

    RedDot[i] = new redDot(random(0,400),random(0,400));
  }
}


void draw() {

  background(255);

  for (int i = 0; i < RedDot.length; i++) {

    RedDot[i].redDotDisplay();
  }
}
