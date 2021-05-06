class Ball{
  int sizeBall = 25;
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(-0.008,0.2);
  Ball(PVector start, PVector startSpeed){
  pos = start;
  speed = startSpeed;
  }
  
  void ballDisplay(){
    ellipse(pos.x, pos.y, sizeBall, sizeBall);
  }
  
  void ballUpdate(){
    if (pos.y >=400){
     acceleration = new PVector(0,0);
     println(speed.x);     
     speed = new PVector(0,0);

    }
    pos.add(speed);
    speed.add(acceleration);
    //speed.mult(0.995);
  }
  
  void ballLaunch(){
    
  }
  
}
