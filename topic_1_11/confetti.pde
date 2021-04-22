class Confetti {
  
  color c;        // a confetti has a colour
  //float posVector.x;     // a confetti has an x-position
  //float posVector.y;     // a confetti has an y-position
  float radius;    // a confetti has a radius;
  //float speedVector.x;       // the confetti moves with some speed in x direction
  //float speedVector.y;       // the confetti moves with some speed in y direction
  PVector speedVector, posVector;
  
  //constructor: gives values to the variables
  Confetti() { 
    //random pinkish colour
    c = color(int(random(180,255)), int(random(0,150)), int(random(100,200)));  //pinkish
    
    //random radius and position
    radius = random(10,25);
    posVector = new PVector(int(random(radius,width-radius)), int(random(radius,height-radius)));
    //posVector.x = int(random(radius,width-radius));
    //posVector.y = int(random(radius,height-radius));
    
    // random speed
    speedVector = new PVector(int(random(-3,4)),int(random(-3,4)));
    //speedVector.x = int(random(-3,4));               // speed in x-direction
    while (speedVector.x==0) speedVector.x = int(random(-3,4)); // nonzero speed
    //speedVector.y = int(random(-3,4));               // speed in y-direction
    while (speedVector.y==0) speedVector.y = int(random(-3,4)); // nonzero speed
  }
    
  void render() {
    //noStroke();
    fill(c);
    ellipse(posVector.x, posVector.y, 2*radius, 2*radius);
  }
  
  void update() {
    //if the confetti reaches the left wall or the right wall, it bounces
    if ((posVector.x > width - radius - speedVector.x) || (posVector.x < radius - speedVector.x)) {
      speedVector.x = -speedVector.x;
    }
    posVector.x = posVector.x + speedVector.x;
    //if the confetti reaches the top wall or the botton wall, it bounces
    if ((posVector.y > height - radius - speedVector.y) || (posVector.y < radius - speedVector.y)) {
      speedVector.y = -speedVector.y;
    }
    posVector.y = posVector.y + speedVector.y;
  }
  
  void set_speed(PVector speedVector){
    this.speedVector = speedVector;
    //this.speedVector.x = dx;
    //this.speedVector.y = dy;
  }  
}
