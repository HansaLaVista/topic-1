class Wall{
  int sizeX, sizeY;
  PVector Pos;
  Ball ball;
  color wallcolor;
  PVector tempPos;
  Wall(int widt, int heigt, Ball ball){
    this.ball = ball;
    sizeX = 20;
    sizeY = 200;
    wallcolor = color(100,50,50);
    Pos = new PVector(widt*.75-sizeX/2, heigt-sizeY/2);
  }
  
  void update(){
    tempPos = ball.callPos();
    if(tempPos.x > Pos.x-sizeX/2 && tempPos.x < Pos.x+sizeX/2 && tempPos.y < Pos.y+sizeY/2){
      wallcolor = color(random(255),random(255),random(255));
    }
  }
  
  void display(){
    rectMode(CENTER);
    fill(wallcolor);
    rect(Pos.x,Pos.y,sizeX,sizeY);
  } 
  
}
