class Catapult {

Ball ball;                                 //create object within class
PVector sPos;                              //initiate starting position vector and position
PVector posChange;                         //change vector
  Catapult(PVector Pos, Ball ball) {
    this.ball = ball;                      //set ball to the same ball as in the main class
    sPos = Pos.copy();                            //set starting position           
  }
  void Update() {
    //println(sPos);
  }

  void Display() {     
    stroke(1);
    fill(139,69,19);                       //set catapult colour
    beginShape();                          //start vertex based catapult shape
    vertex(sPos.x,sPos.y+50);
    vertex(sPos.x+50,sPos.y-10);
    vertex(sPos.x+60,sPos.y-10);
    vertex(sPos.x+5,sPos.y+55);
    vertex(sPos.x+5,sPos.y+90);
    vertex(sPos.x-5,sPos.y+90);
    vertex(sPos.x-5,sPos.y+55);
    vertex(sPos.x-60,sPos.y-10);
    vertex(sPos.x-50,sPos.y-10);
    vertex(sPos.x,sPos.y+50);
    endShape();    
  }
  
  void Dragged(int x, int y){
    posChange = new PVector(x,y);          //set position change vector based on mouse x and y passed beforehand
    ball.dragged(posChange);               //call ball dragging function in ball object
  }
  
  void Released(){
    PVector speedSet = new PVector((sPos.x-posChange.x)/7, (sPos.y-posChange.y)/7);  //set speed using
    ball.ballLaunch(speedSet);             //the starting position of the ball    
  }
  void action(char b){
    if (b == 'a'){
      sPos.x-=3;
    }
    if (b == 'd'){
      sPos.x+=3;
    }
    
  }
  
  PVector position(){
   return sPos.copy(); 
  }
}
