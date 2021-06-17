class Wall{
  int sizeX, sizeY; // variables for size
  PVector Pos; // position PVector
  Ball ball; 
  color wallcolor;
  PVector tempPos;
  Wall(int widt, int heigt, Ball ball){ // object ball in order to access ball positon
    this.ball = ball;
    sizeX = 20;
    sizeY = 200;
    wallcolor = color(100,50,50);
    Pos = new PVector(widt*.75-sizeX/2, heigt-sizeY/2); // position of the wall in the screen
  }
  
  void update(){
    tempPos = ball.pos; // ball position to determine collision detection
    if((tempPos.x > Pos.x-sizeX/2 && tempPos.x < Pos.x+sizeX/2&& tempPos.y > Pos.y-sizeY/2) ){
      wallcolor = color(random(255),random(255),random(255));
    }
  }
  
  void display(){ // displaying the wall
    rectMode(CENTER);
    fill(wallcolor);
    rect(Pos.x,Pos.y,sizeX,sizeY);
  } 
  
}
