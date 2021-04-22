class Confetti {
  
  color c;        // a confetti has a colour
  float xpos;     // a confetti has an x-position
  float ypos;     // a confetti has an y-position
  float radius;    // a confetti has a radius;
  float dx;       // the confetti moves with some speed in x direction
  float dy;       // the confetti moves with some speed in y direction
  
  //constructor: gives values to the variables
  Confetti() { 
    //random pinkish colour
    c = color(int(random(180,255)), int(random(0,150)), int(random(100,200)));  //pinkish
    
    //random radius and position
    radius = random(10,25);
    xpos = int(random(radius,width-radius));
    ypos = int(random(radius,height-radius));
    
    // random speed
    dx = int(random(-3,4));               // speed in x-direction
    while (dx==0) dx = int(random(-3,4)); // nonzero speed
    dy = int(random(-3,4));               // speed in y-direction
    while (dy==0) dy = int(random(-3,4)); // nonzero speed
  }
    
  void render() {
    //noStroke();
    fill(c);
    ellipse(xpos, ypos, 2*radius, 2*radius);
  }
  
  void update() {
    //if the confetti reaches the left wall or the right wall, it bounces
    if ((xpos > width - radius - dx) || (xpos < radius - dx)) {
      dx = -dx;
    }
    xpos = xpos + dx;
    //if the confetti reaches the top wall or the botton wall, it bounces
    if ((ypos > height - radius - dy) || (ypos < radius - dy)) {
      dy = -dy;
    }
    ypos = ypos + dy;
  }
  
  void set_speed(float dx, float dy){
    this.dx = dx;
    this.dy = dy;
  }  
}
