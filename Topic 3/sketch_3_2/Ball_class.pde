class Ball{
  int sizeBall = 25;
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(-0.008,0.2);
  Ball(PVector start, PVector startSpeed){
  pos = start.copy();
  speed = startSpeed;
  }
  
  void ballDisplay(){
    fill(255,30,30);
    ellipse(pos.x, pos.y, sizeBall, sizeBall);
  }
  
  void ballUpdate(){
    if (pos.y >=500){
     acceleration = new PVector(0,0);   
     speed = new PVector(0,0);
     pos = start.copy();

    }
    pos.add(speed);
    speed.add(acceleration);
    //speed.mult(0.995);
  }
  
  void ballLaunch(){
    
  }
  void click(int x, int y){
   pos = new PVector(x, y); 
  }
  
}
