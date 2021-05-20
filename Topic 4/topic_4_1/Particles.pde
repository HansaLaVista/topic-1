class Particle {

  // variables for the partciles
  PVector Pos;
  PVector Velocity;
  PVector Acceleration;
  float partSize;
  color partColour;
  int alpha;
  int startTime;
  boolean trail;


  Particle(PVector pos, float fSize) { // Particle constructor
    Pos = pos.copy();
    Velocity = new PVector(random(-5, 5), random(-5, 5)); // velocity has random PVector values
    Acceleration = new PVector(.99, .99); // acceleration has random PVcetor values
    partSize = (random(1, 5)*2*fSize);
    partColour = color(random(255), random(255), random(255));
    alpha = 255;
    startTime = millis(); // start time for the partciles to start fading
  }


  void particleUpdate() { // update the velocity and position of the partciles 
    Velocity = Velocity.mult(.97);
    Pos = Pos.add(Velocity);
  }

  void particleRender() { // draw the partciles
    if (millis() - startTime > 2000) { 
      alpha -= 5;  // 2 seconds after explosion, partciles start fading
    }
    fill(partColour, alpha); // color and alpha value of the particles
    noStroke();
    ellipse(Pos.x, Pos.y, partSize, partSize);  
  }
}
