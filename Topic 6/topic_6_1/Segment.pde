class Segment{
 float lengt;
 float force,velocity,angle;
 float spring, damper, mass;
  Segment(){
    lengt = 15;
    force = 10;
    velocity = 0;
    angle = PI/40;
    spring = 0.3;
    damper = 0.1;
    mass = 2;
    
  }
  
  void update(float otherVelo, float otherForce){
    force = force*.8;
    velocity += otherVelo + force/mass;
    angle+=(velocity/360000);
  }
  
  void render(){
    stroke(5);
    rotate(angle);    
    line(0,0,0,-lengt);
    translate(0,-lengt);    
  }
}
