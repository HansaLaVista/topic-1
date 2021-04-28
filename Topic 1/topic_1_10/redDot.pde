class redDot {


  float dotX;
  float dotY;


  redDot(float posX, float posY) {
    dotX = posX;
    dotY = posY;
  }


  void redDotDisplay() {
    fill(255,0,0);
    noStroke();
    ellipse(dotX,dotY,10,10);
  }
}
