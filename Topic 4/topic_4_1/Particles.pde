class Particle {

  PVector Pos;
  PVector Velocity;
  PVector Acceleration;
  float partSize;
  color partColour;
  int alpha;
  int startTime;
  boolean trail;


  Particle(PVector pos, float fSize) {
    Pos = pos.copy();
    Velocity = new PVector(random(-5, 5), random(-5, 5));
    Acceleration = new PVector(.99, .99);
    partSize = (random(1, 5)*2*fSize);
    partColour = color(random(255), random(255), random(255));
    alpha = 255;
    startTime = millis();
    //trail = false;
  }

  Particle(PVector pos, float fSize, int p) {
    trail = true;
    Pos = pos.copy();
    Velocity = new PVector(random(-1, 1), random(3));
    Acceleration = new PVector(.99, .99);
    partSize = (random(1, 5)*2*fSize);
    partColour = color(random(255), random(255), random(255));
    alpha = 255;
    startTime = millis();
  }

  void particleUpdate() {
    if (!trail) {
      Velocity = Velocity.mult(.97);
      Pos = Pos.add(Velocity);
    } else {
      Velocity = Velocity.mult(.8);
      Pos = Pos.add(Velocity);
      println("h");
      //alpha -=10;
    }
  }

  void particleRender() {
    if (!trail) {
      if (millis() - startTime > 2000) {
        alpha -= 5;
      }
      fill(partColour, alpha);
      noStroke();
      ellipse(Pos.x, Pos.y, partSize, partSize);
    }
    else{
      fill(255);
      rect(Pos.x, Pos.y, 100, 100);
      alpha--;
      println("g");
    }
  }
  
  int alfa() {
    return alpha;
  }
}
