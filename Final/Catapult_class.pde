class Catapult {

  Ball ball;                                 //create object within class
  PVector sPos;  //initiate starting position vector and position
  float diam, rectSize, angle;
  PVector posChange;                         //change vector
  boolean moveLeft, moveRight, tiltLeft, tiltRight, stopLeft, stopRight;
  Catapult(PVector Pos, Ball ball) {
    this.ball = ball;                      //set ball to the same ball as in the main class
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
    posChange = new PVector(x, y);          //set position change vector based on mouse x and y passed beforehand
    ball.dragged(posChange);               //call ball dragging function in ball object
  }

  void Released() {
    PVector speedSet = new PVector((sPos.x-posChange.x)/7, (sPos.y-posChange.y)/7);  //set speed using
    ball.ballLaunch(speedSet);             //the starting position of the ball
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
  }

  void action() {
    if (moveLeft) {
      sPos.x-=3;
    }
    if (moveRight) {
      sPos.x+=3;
    }
    if (tiltLeft) {
      angle-=.03;
    }
    if (tiltRight) {
      angle+=0.03;
    }
    if (angle>1) {
      stopRight=true;
    } else {
      stopRight=false;
    }
    if (angle<-1) {
      stopLeft= true;
    } else {
      stopLeft=false;
    }
  }

  PVector position() {
    return sPos.copy();
  }
}
