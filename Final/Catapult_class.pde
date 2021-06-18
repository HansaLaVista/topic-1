class Catapult {

  Ball ball;                                 //create object within class
  PVector sPos;  //initiate starting position vector and position
  float diam;
  PVector posChange;                         //change vector
  boolean moveLeft, moveRight;
  Catapult(PVector Pos, Ball ball) {
    this.ball = ball;                      //set ball to the same ball as in the main class
    sPos = Pos.copy();                    //set starting position
    diam = 50;
  }
  void Update() {
    //println(sPos);
    action();
  }

 void Display() {     
    stroke(1);   
     fill(0,50,210);
    beginShape();
    ellipse(sPos.x, sPos.y, diam*4, diam);
    vertex(sPos.x-40,sPos.y-20);
    vertex(sPos.x-40,sPos.y-50);
     vertex(sPos.x+40,sPos.y-40);
    vertex(sPos.x+40,sPos.y-20);
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
  
  void actionCheck(char b){
    if (b == 'a'){
     moveLeft = true; 
    }
    if ( b== 'd'){
     moveRight = true; 
    }
  }
  
  void haltCheck(char b){
    if (b == 'a'){
     moveLeft = false; 
    }
    if ( b== 'd'){
     moveRight = false; 
    }    
  }
  
  void action() {

    if (moveLeft) {
      sPos.x-=3;
    }
    if (moveRight) {
      sPos.x+=3;
    }
  }

  PVector position() {
    return sPos.copy();
  }
}
