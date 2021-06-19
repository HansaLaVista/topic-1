
class Tank {

  Projectile bullet;    //create bullet object within class
  
  PVector sPos;  //initiate starting position vector and position
  float diam, rectSize, angle;
  PVector posChange;                         //change vector
  boolean moveLeft, moveRight, tiltLeft, tiltRight, stopLeft, stopRight;
  Tank(PVector Pos, Projectile bullet) {
    this.bullet = bullet;                  //set bullet to the same bullet as in the main class
    sPos = Pos.copy();                    //set starting position
    diam = 50;
    rectSize = 15;  
  }
  void Update() {
    action();
  }

  void Display() {      //drawing the tank and barrel
    stroke(1);   
    pushMatrix();
    translate(sPos.x, sPos.y-60+rectSize*3.5);
    rotate(angle);
    rectMode(CENTER);
    fill(200,40,40);
    rect(0, -rectSize*3.5, rectSize, rectSize*7);
    popMatrix();
    fill(0, 50, 210);
    beginShape();
    ellipse(sPos.x, sPos.y, diam*4, diam);
    vertex(sPos.x-40, sPos.y-20);
    vertex(sPos.x-40, sPos.y-50);
    vertex(sPos.x+40, sPos.y-40);
    vertex(sPos.x+40, sPos.y-20);
    endShape();
   
  }

  void Dragged(int x, int y) {
    posChange = new PVector(x, y);            //set position change vector based on mouse x and y passed beforehand
    bullet.dragged(posChange);               //call bullet dragging function in bullet object
  }


  void actionCheck(char b) { // if user presses a --> tank moves left
    if (b == 'a') {
      moveLeft = true;
    }
    if ( b== 'd') {       // ifuser presses d --> tank moves right
      moveRight = true;
    }
    if ( b== 'j'&& !stopLeft) {    // rotation booleans
      tiltLeft = true;
    }
    if ( b== 'l' && !stopRight) {
      tiltRight = true;
    }
  }

  void haltCheck(char b) {  // if key is released, booleans for movements are set to false
    if (b == 'a') {
      moveLeft = false;
    }
    if ( b== 'd') {
      moveRight = false;
    }
    if ( b== 'j') {
      tiltLeft = false;
    }
    if ( b== 'l') {
      tiltRight = false;
    }
    if ( b==' ' && !bullet.shot) { // shoot the projectile by pressing the spacebar
      PVector speedSet = new PVector((sin(angle)*15), (-cos(angle)*15)); 
      bullet.ProjectileLaunch(speedSet);  // bullet is rotated to the angle of the barrel
    }
  }

  void action() {    //
    if (moveLeft) {
      sPos.x-=3;
    }
    if (moveRight) {
      sPos.x+=3;
    }
    if (tiltLeft) {
      angle-=.045;
    }
    if (tiltRight) {
      angle+=0.045;
    }
    if (angle>1.3) {   // setting right limit for the rotation of the barrel
      stopRight=true;
      tiltRight=false;
    } else {
      stopRight=false;
    }
    if (angle<-1.3) { // setting left limit for the rotation of the barrel
      stopLeft= true;
      tiltLeft= false;
    } else {
      stopLeft=false;
    }
  }

  PVector position() {
    return sPos.copy();
  }
}
