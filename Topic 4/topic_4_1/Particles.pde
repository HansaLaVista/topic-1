class particles {

  PVector Pos;
  PVector Velocity;
  PVector Acceleration;
  float partSize;


  particles(int wit, int heit) {

    Pos = new PVector(random(wit), random(heit));
    Velocity = new PVector();
    Acceleration = new PVector();
    partSize = (random(1,5));
 }

    void particlesRender() {

      fill(0, 255, 0);
      noStroke();
      ellipse(Pos.x,Pos.y,partSize,partSize);
   
  }
}
