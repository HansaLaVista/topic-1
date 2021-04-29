class blueDot {


  float dotX;
  float dotY;


  blueDot(float posX, float posY) {
    dotX = posX;
    dotY = posY;
  }


  void blueDotDisplay() {
    fill(255,0,0);
    noStroke();
    ellipse(dotX,dotY,10,10);
  }
}
