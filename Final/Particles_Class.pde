class Particle {

  // variables for the partciles
  PVector partPos;       
  PVector partVelocity;
  PVector partAcceleration;
  float partSize;
  color partColour;
  int alpha;
  int startTime;


  Particle (PVector pos, float fSize) { // Particle constructor
    partPos = pos.copy();
    partVelocity = new PVector(random(-5, 5), random(-5, 5));      // velocity has random PVector values
    partAcceleration = new PVector(.99, .99);                     // acceleration has random PVcetor values
    partSize = (random(1, 5)*.05*fSize);                         // size of the partciles are random
    partColour = color(random(255), random(255), random(255));  // colors of the particles are random
    alpha = 255;                                               // alpha channel of the particles starts at max
    startTime = millis();                                     // start time for the partciles to start fading
  }


  void particleUpdate() { // update the velocity and position of the partciles 
    partVelocity = partVelocity.mult(.97);
    partPos = partPos.add(partVelocity);
  }

  void particleRender() {               // draw the partciles & fading
    if (millis() - startTime > 2000) { 
      alpha -= 5;                      // 2 seconds after explosion, partciles start fading
    }
    fill(partColour, alpha);           //colour, stroke and draw
    noStroke();
    ellipse(partPos.x, partPos.y, partSize, partSize);  
  }
}
