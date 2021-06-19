<<<<<<< HEAD:Final/Catapult_class.pde
class Catapult {

  Ball ball;    //create object within class
  
  PVector sPos;  //initiate starting position vector and position
  float diam, rectSize, angle;
  PVector posChange;                         //change vector
  boolean moveLeft, moveRight, tiltLeft, tiltRight, stopLeft, stopRight;
  FiringSystem [] firingSystem;
   int sparksAmount;
  Catapult(PVector Pos, Ball ball) {
    this.ball = ball;                      //set ball to the same ball as in the main class
    sPos = Pos.copy();                    //set starting position
    diam = 50;
    rectSize = 15;
    sparksAmount = 15;
  
    firingSystem = new FiringSystem[sparksAmount];
    for (int i = 0; i<sparksAmount; i++) {               //create the objects within array
      firingSystem[i] = new FiringSystem();
    }
   
  }
  void Update() {
    action();
  }

  void Display() {     
    stroke(1);   
    pushMatrix();
    translate(sPos.x, sPos.y-60+rectSize*3.5);
    rotate(angle);
    firingSystem[systemCount].begin(sPos, ball.sizeBullet); // generating the particles
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
    
      for (int i=0; i<systemAmount; i++) {  //for loop for updating and rendering object array
      firingSystem[i].update();
      firingSystem[i].render();
    }
   
  }

  void Dragged(int x, int y) {
    posChange = new PVector(x, y);          //set position change vector based on mouse x and y passed beforehand
    ball.dragged(posChange);               //call ball dragging function in ball object
  }


  void actionCheck(char b) {
    if (b == 'a') {
      moveLeft = true;
    }
    if ( b== 'd') {
      moveRight = true;
    }
    if ( b== 'j'&& !stopLeft) {
      tiltLeft = true;
    }
    if ( b== 'l' && !stopRight) {
      tiltRight = true;
    }
  }

  void haltCheck(char b) {
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
    if ( b==' ' && !ball.shot) {
      PVector speedSet = new PVector((sin(angle)*15), (-cos(angle)*15));
      ball.ballLaunch(speedSet);
    }
  }

  void action() {
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
    if (angle>1.3) {
      stopRight=true;
      tiltRight=false;
    } else {
      stopRight=false;
    }
    if (angle<-1.3) {
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
=======
class Tank {

  Projectile bullet;    //create object within class
  
  PVector sPos;  //initiate starting position vector and position
  float diam, rectSize, angle;
  PVector posChange;                         //change vector
  boolean moveLeft, moveRight, tiltLeft, tiltRight, stopLeft, stopRight;
  Tank(PVector Pos, Projectile bullet) {
    this.bullet = bullet;                      //set bullet to the same bullet as in the main class
    sPos = Pos.copy();                    //set starting position
    diam = 50;
    rectSize = 15;
  
   
  }
  void Update() {
    action();
  }

  void Display() {     
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


  void actionCheck(char b) {
    if (b == 'a') {
      moveLeft = true;
    }
    if ( b== 'd') {
      moveRight = true;
    }
    if ( b== 'j'&& !stopLeft) {
      tiltLeft = true;
    }
    if ( b== 'l' && !stopRight) {
      tiltRight = true;
    }
  }

  void haltCheck(char b) {
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
    if ( b==' ' && !bullet.shot) {
      PVector speedSet = new PVector((sin(angle)*15), (-cos(angle)*15));
      bullet.ProjectileLaunch(speedSet);
    }
  }

  void action() {
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
    if (angle>1.3) {
      stopRight=true;
      tiltRight=false;
    } else {
      stopRight=false;
    }
    if (angle<-1.3) {
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
>>>>>>> main:Final/Tank_class.pde