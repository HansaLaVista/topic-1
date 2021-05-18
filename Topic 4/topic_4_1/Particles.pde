class Particle {

  PVector Pos;
  PVector Velocity;
  PVector Acceleration;
  float partSize;
  color partColour;
  int alpha;
  int startTime;


  Particle(PVector pos, float fSize) {
    Pos = pos.copy();
    Velocity = new PVector(random(-5, 5), random(-5, 5));
    Acceleration = new PVector(.99,.99);
    partSize = (random(1, 5)*fSize);
    partColour = color(random(255),random(255),random(255));
    alpha = 255;
    startTime = millis();
  }

  void particleUpdate(){
    Velocity = Velocity.mult(.97);
    Pos = Pos.add(Velocity);
  }

  void particleRender() {
    if(millis() - startTime > 2000){
     alpha -= 5; 
    }
    fill(partColour, alpha);
    noStroke();
    ellipse(Pos.x, Pos.y, partSize, partSize);
  }
}
