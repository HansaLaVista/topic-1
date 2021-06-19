class Spark {


  // variables for the sparks
  PVector sparkPos;       
  PVector sparkVelocity;
  PVector sparkAcceleration;
  float sparkSize;
  color sparkColour;
  int alpha;
  int startTime;



  Spark(PVector pos, float size) {
    sparkPos = pos.copy();
    sparkVelocity = new PVector(random(-5, 5), random(-5, 5));      // velocity has random PVector values
    sparkAcceleration = new PVector(.99, .99);                     // acceleration has random PVcetor values
    sparkSize = (random(1, 5)*.05*size);                          // size of the partciles are random
    sparkColour = color(random(255), random(255), random(255));  // colors of the particles are random
    alpha = 255;                                                // alpha channel of the particles starts at max
    startTime = millis();
  }
  
  
  
    void sparksRender() {               // draw the partciles & fading
    if (millis() - startTime > 2000) { 
      alpha -= 5;                      // 2 seconds after explosion, partciles start fading
    }
    fill(sparkColour, alpha);   
    noStroke();
    ellipse(sparkPos.x, sparkPos.y, sparkSize, sparkSize);  
  }
  
  
   void sparksUpdate() { // update the velocity and position of the partciles 
    sparkVelocity = sparkVelocity.mult(.97);
    sparkPos = sparkPos.add(sparkVelocity);
  }
}