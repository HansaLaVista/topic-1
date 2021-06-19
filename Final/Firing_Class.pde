class Spark {


  // variables for the sparks
  PVector sparkPos;       
  PVector sparkVelocity;
  PVector sparkAcceleration;
  float sparkSize;
  color sparkColour;
  int alpha;
  int startTime;



  Spark(float size) {
    sparkPos = new PVector(0,size*2);
    sparkVelocity = new PVector(randomGaussian()*2+1, randomGaussian()*3+10);      // velocity has random PVector values
    sparkAcceleration = new PVector(.99, .99);                     // acceleration has random PVcetor values
    sparkSize = (random(1, 5)*.05*size);                          // size of the partciles are random
    sparkColour = color(200, 0, 0);  // colors of the particles are random
    alpha = int(random(150,255));                                                // alpha channel of the particles starts at max
    startTime = millis();
  }
  
  
  
    void sparksRender() {               // draw the partciles & fading
    if (millis() - startTime > 2000) { 
      alpha -= int(random(10, 20));                      // 2 seconds after explosion, partciles start fading
    }
    fill(sparkColour, alpha);   
    noStroke();
    ellipse(sparkPos.x, sparkPos.y, sparkSize, sparkSize);  
  }
  
  
   void sparksUpdate() { // update the velocity and position of the partciles 
    sparkVelocity = sparkVelocity.mult(.97);
    sparkPos = sparkPos.add(sparkVelocity);
    alpha -= int(random(10, 20));
  }
}
