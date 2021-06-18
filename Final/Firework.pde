class Firework {
  boolean boom;      //initiate variables
  PVector pos;
  PVector speed;
  float size;
  float explodeTime;
  float angle;
  Ball ball;

  Firework(int xSize, int ySize, Ball ball) {  //constructor
    this.ball = ball;
    pos = new PVector(random(100, xSize-100), -50);    //assign semi random position
    speed = new PVector(random(0, 4)-2, random(6, 2));  //assign speed
    size = 100*random(1, 3)/3;    //assign random size
    explodeTime = ySize*2;  //assign random explosion moment for each firework
    angle = asin(speed.x/sqrt(pow(speed.x, 2)+pow(speed.y, 2)));  //set angle of firework according to speed
    boom = false;  //set boolean false
  }

  void render() {
    fill(240, 50, 4);  //firework color
    stroke(1);
    pushMatrix();
    translate(pos.x, pos.y);  //translate and rotate
    rotate(angle);
    //   rectMode(CENTER);
    ellipse(0, size, size, size);    //firework shape
    //rect(0, 30*size, 20*size, 40*size);
    // triangle(0, 0, 0-10*size, 0+10*size, 0+10*size, 0+10*size);
    popMatrix();
  }

  void update() {
    if (boom==false) {  //update position if not exploded yet
      pos.add(speed);
    }
    if (pos.y >= explodeTime) {  //if firework reaches explosion point boolean is set
      boom = true;
    }
  }

  void collide( ) {
    float distX = ball.pos.x- pos.x  ;
    float distY = ball.pos.y - pos.y  ;
    float posDiff = sqrt(distX*distX + distY*distY);
    float collideDist = ball.sizeBall/1.5 + size/1.5;

    if (posDiff < collideDist ) {
      particlesystem[systemCount].begin(firework.position(), firework.size()); 
      boom = true;
      ball.reset();
    }
  }

  boolean explosion() {  //boolean method for checking explosion
    return boom;
  }

  PVector position() {
    return pos;        //pvector method for the position
  }

  float size() {
    return size;       //float method for size of the firework
  }
}
