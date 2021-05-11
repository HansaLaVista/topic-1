class Catapult {

Ball ball = new Ball(new PVector(0,0));
PVector sPos = new PVector(0,0);
PVector posChange;
  Catapult(PVector Pos, Ball ball) {
    this.ball = ball;
    this.sPos = Pos;
  }


  void Display() {
    fill(139,69,19);
    beginShape();
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


  void Update() {
  }
  
  void Dragged(int x, int y){
    posChange = new PVector(x,y);
    ball.dragged(posChange);
  }
  
  void Released(){
    PVector speedSet = new PVector((sPos.x-posChange.x)/7, (sPos.y-posChange.y)/7);
    ball.ballLaunch(speedSet);
    
  }
}
