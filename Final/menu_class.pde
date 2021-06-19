class Menu{
  float high, wide;      //initiate variables
  int score;
  
  Menu(int xSize, int ySize){
    high = ySize;        //set variables
    wide = xSize;
    score = 0;
  }
  
  void update(boolean plus){
    if(plus){
     score ++;           //update score if scored
    }
  }
  
  void display(){
    fill(50,50,50);      //display rectangle and text for menu bar
    noStroke();
    rectMode(CORNER);
    rect(0,high*.85,wide, high*.15);
    fill(255);
    textSize(30);
    text("Press A or D to ride",wide*.02, high*.89);
    text("Press J or L to aim",wide*.02, high*.93);
    fill(255,100,0);
    textSize(50);
    text("SPACEBAR to shoot", wide*.02, high*.99);
    fill(255,100,100);
    textSize(80);
    text("SCORE:" + str(score), wide*.6, high*.97);    //show score
  }
}
