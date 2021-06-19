
class Projectile {

  int sizeBullet = 15;    //initialise variables
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(0, 0.2);  //set set gravity and 'wind resistance'
  float windRes =.997;
  boolean shot= false;
  boolean dragging = false;
  int screenX, screenY;
  float angle;
  FiringSystem [] firingSystem;
  int sparksAmount;

  Projectile(PVector start, int widt, int heigt) {
    angle = 0;
    screenX = widt;
    screenY = heigt;
    pos = start.copy();                              //copy vector for start position
    speed = new PVector(0, 0);        //set speed to 0
    sparksAmount = 15;
    firingSystem = new FiringSystem[sparksAmount];
    for (int i = 0; i<sparksAmount; i++) {               //create the objects within array
      firingSystem[i] = new FiringSystem();
    }
  }


  void ProjectileDisplay() {
    stroke(1);
    fill(255, 215, 0);                              //Projectile colour
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    ellipse(0, -sizeBullet/2, sizeBullet, sizeBullet);    //draw Projectile
    rectMode(CENTER);
    rect(0, sizeBullet/2, sizeBullet, sizeBullet*2);
    for (int i=0; i<systemAmount; i++) {  //for loop for updating and rendering object array
      firingSystem[i].update();
      firingSystem[i].render();
    }
    popMatrix();
  }

  void ProjectileUpdate(PVector tankPos) {
    if (shot) {                //check if the Projectile has been shot, then update speed and position
      pos.add(speed);
      speed.x *= windRes;
      speed.add(acceleration);
      if (pos.y >=screenY) {         // check if the Projectile is above bottom of the screen
        reset();
      }
    } else if (!dragging) {
      pos = tankPos.copy();
    }
    angle = acos(-speed.y/speed.mag())*(speed.x/abs(speed.x));
  }

  void ProjectileLaunch(PVector setSpeed) {
    speed = setSpeed.copy();          //set speed of Projectile
    shot = true;                      //Projectile has been shot
    dragging = false;
    firingSystem[systemCount].begin(pos, bullet.sizeBullet, angle); // generating the particles
  }
  void dragged(PVector drag) {
    pos = drag.copy();      //update Projectile position according to the mouse coordinates
    dragging = true;
  }
  void reset() {
    speed = new PVector(0, 0);//otherwise reset the Projectile to the tank
    pos = start.copy();
    shot = false;
    dragging = false;
  }

  PVector callPos() {
    return(pos);                      //return Projectile position
  }
  boolean callShot() {
    return(shot);                     //return if the Projectile has been shot or not
  }
}
