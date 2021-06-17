class Ball{
  int sizeBall = 25;                              //initialise variables
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(-0.008,0.2);  //set set gravity and 'wind resistance'
  boolean shot = false;
  int screenX, screenY;
  Ball(PVector start, int widt, int heigt){
    screenX = widt;
    screenY = heigt;
  pos = start.copy();                              //copy vector for start position
  speed = new PVector(0,0);                        //set speed to 0

  }
  
  void ballDisplay(){
    fill(255,30,30);                              //ball colour
    ellipse(pos.x, pos.y, sizeBall, sizeBall);    //draw ball
  }
  
  void ballUpdate(){
    if (shot){                //check if the ball has been shot, then update speed and position
    pos.add(speed);
    speed.add(acceleration);
    }
    if (pos.y >=screenY && shot){         // check if the ball is above bottom of the screen
     speed = new PVector(0,0);//otherwise reset the ball to the catapult
     pos = start.copy();
     shot = false;
    }    
  }
  
  void ballLaunch(PVector setSpeed){
    speed = setSpeed.copy();          //set speed of ball
    shot = true;                      //ball has been shot
  }
  void dragged(PVector drag){
   pos = drag.copy();                 //update ball position according to the mouse coordinates
  }
  PVector callPos(){
    return(pos);                      //return ball position
  }
  boolean callShot(){
    return(shot);                     //return if the ball has been shot or not
  }
  
}
