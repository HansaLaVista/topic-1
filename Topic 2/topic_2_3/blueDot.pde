class blueDot {


  float dotX;
  float dotY;
  PVector Pos;
  float gSize;


  blueDot(int wit, int heit) {
    Pos =gaussianPos(wit, heit);
    //dotX = gaussianPos.x;
    //dotY = Pos.y;
    gSize = gaussianSize();
  }


  void blueDotDisplay() {
    fill(0, 0, 200);
    noStroke();
    float temp = gaussianSize();
    ellipse(Pos.x, Pos.y, gSize, gSize);
  }
  
  PVector gaussianPos(int widt, int heigt) {
    float sd = 60;
    float xgaus = (randomGaussian() * sd) + widt/2;
    float ygaus = (randomGaussian() * sd) + heigt/2;
    PVector position = new PVector(xgaus, ygaus);
    return position;
  }
  
  float gaussianSize() {
    float sd = 8;
    float size = (randomGaussian()*sd) + 10;
    return size;
  }
}
