class Ball{
  int sizeBall = 25;
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(-0.008,0.2);
  boolean shot = false;
  Ball(PVector start){
  pos = start.copy();
  speed = new PVector(0,0);

  }
  
  void ballDisplay(){
    fill(255,30,30);
    ellipse(pos.x, pos.y, sizeBall, sizeBall);
  }
  
  void ballUpdate(){
    if (shot){
    pos.add(speed);
    speed.add(acceleration);
    }
    if (pos.y >=500){  
     speed = new PVector(0,0);
     pos = start.copy();
     shot = false;
    }    
  }
  
  void ballLaunch(PVector setSpeed){
    speed = setSpeed.copy();
    shot = true;
  }
  void dragged(PVector drag){
   pos = drag.copy(); 
  }
  PVector callPos(){
    return(pos);
  }
  boolean callShot(){
    return(shot);
  }
  
}
