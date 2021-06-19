
class Firework {
  boolean boom;      // variables for the meteor
  PVector meteorPos, meteorSpeed;
  float size, angle;
  Ball ball; // object ball in order to get it' position

  Firework(int xSize, int ySize, Ball ball) {  // meteor constructor
    this.ball = ball;
    meteorPos = new PVector(random(100, xSize-100), -50);      //assign random position 
    meteorSpeed = new PVector(random(0, 4)-2, random(6, 2));  //assign random speed
    size = 100*random(1, 3)/3;                               //assign random size                      
    angle = -asin(meteorSpeed.x/sqrt(pow(meteorSpeed.x, 2)+pow(meteorSpeed.y, 2)));  //set angle of meteor according to speed
    boom = false;                                          //set explosion boolean false
  }

  void render() {        // drawaing the meteor shape
    fill(192,192,192);  //meteor color
    stroke(1); 
    pushMatrix();
    translate(meteorPos.x, meteorPos.y);    //translate and rotate
    rotate(angle);
    beginShape();             // make shape
    vertex(-size/4, -size/2);
    vertex(size/4, -size/2);
    vertex(size/2,-size/4);
    vertex(size/2,size/4);
    vertex(size/4,size/2);
    vertex(-size/4,size/2);
    vertex(-size/2,size/4);
    vertex(-size/2,-size/4);
     vertex(-size/4, -size/2);
    endShape();
    popMatrix();
  }

  void update() {
    if (boom==false) {  //update position if not exploded yet
      meteorPos.add(meteorSpeed);
    }
  }

  void collide( ) {                                 // collision detection between bullet and meteor
    float posDiff = ball.pos.dist(meteorPos);      // getting the distance between the bullet and meteor
    float collideDist = ball.sizeBullet/2 + size/2; //the distance betweent the radius/2 where the objects should collide

    if (posDiff < collideDist && ball.shot) {
      particlesystem[systemCount].begin(firework.position(), firework.size()); // generating the particles
      boom = true;     // explosion is true
      ball.reset();   // once explison happens, bullet goes back to initial position (at the tank)
    }
  }

  boolean explosion() {  //boolean method for checking explosion
    return boom;
  }

  PVector position() {
    return meteorPos;   //pvector method for the position
  }

  float size() {
    return size;     //float method for size of the firework
  }
}
