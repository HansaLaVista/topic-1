
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
    angle = -asin(speed.x/sqrt(pow(speed.x, 2)+pow(speed.y, 2)));  //set angle of firework according to speed
    boom = false;  //set boolean false
  }

  void render() {
    fill(192,192,192);  //firework color
    stroke(1);
    pushMatrix();
    translate(pos.x, pos.y);  //translate and rotate
    rotate(angle);
    beginShape();            // make shape
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
    float posDiff = ball.pos.dist(pos);
    float collideDist = ball.sizeBall/2 + size/2;

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
