
class Meteor {
  boolean boom;      // variables for the meteor
  PVector meteorPos, meteorSpeed;
  float size, angle;
  Projectile bullet; // object bullet in order to get it's position

  Meteor(int xSize, Projectile bullet) {  // meteor constructor
    this.bullet = bullet;
    meteorPos = new PVector(random(100, xSize-100), -50);      //assign random position 
    meteorSpeed = new PVector(random(0, 4)-2, random(6, 2));  //assign random speed
    size = randomGaussian()*20+50;                               //assign random size                      
    angle = -asin(meteorSpeed.x/sqrt(pow(meteorSpeed.x, 2)+pow(meteorSpeed.y, 2)));  //set angle of meteor according to speed
    boom = false;                                          //set explosion boolean false
  }

  void render() {        // drawaing the meteor shape
    fill(192, 192, 192);  //meteor color
    stroke(1); 
    pushMatrix();
    translate(meteorPos.x, meteorPos.y);    //translate and rotate
    rotate(angle);
    beginShape();             // make shape
    vertex(-size/4, -size/2);
    vertex(size/4, -size/2);
    vertex(size/2, -size/4);
    vertex(size/2, size/4);
    vertex(size/4, size/2);
    vertex(-size/4, size/2);
    vertex(-size/2, size/4);
    vertex(-size/2, -size/4);
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
    float posDiff = bullet.pos.dist(meteorPos);      // getting the distance between the bullet and meteor
    float collideDist = bullet.sizeBullet/2 + size/2; //the distance betweent the radius/2 where the objects should collide

    if (posDiff < collideDist && bullet.shot) {
      particlesystem[systemCount].begin(meteor.meteorPos, size); // generating the particles
      boom = true;     // explosion is true
      bullet.reset();   // once explison happens, bullet goes back to initial position (at the tank)
    }
  }
}
