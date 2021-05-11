class Ball{
  // variables for the size, speed, position and acceleration of the ball
  int sizeBall = 25;
  PVector pos;
  PVector speed;
  PVector acceleration = new PVector(-0.008,0.2);
  
  Ball(PVector start, PVector startSpeed){ // ball constructor
  pos = start;
  speed = startSpeed;
  }
  
  void ballDisplay(){ 
    ellipse(pos.x, pos.y, sizeBall, sizeBall); // create an ellipse with the the PVector pos
  }
  
  void ballUpdate(){ // update the acceleration and speed depending on the ball's position
    if (pos.y >=400){
     acceleration = new PVector(0,0);
     println(speed.x);     
     speed = new PVector(0,0);

    }
    pos.add(speed);
    speed.add(acceleration);
  
  }
 
  
}
