class redDot {


  float dotX;
  float dotY;


  redDot() {
    dotX = random(0, 400);
    dotY = random(0, 400);
  }


  void redDotDisplay() {
    fill(255,0,0);
    noStroke();
    ellipse(dotX,dotY,10,10);
  }
}
