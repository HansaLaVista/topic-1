class Segment{
 float lengt, tempforce;
 float force,velocity,angle;
 float spring, damper, mass;
  Segment(){
    lengt = 15;
    force = 100;
    tempforce = 100;
    velocity = 0;
    angle = 0;
    spring = 0.3;
    damper = 0.1;
    mass = .2;
    
  }
  
  void update(float otherVelo, float otherForce){
    tempforce = tempforce - otherForce *.1;
    velocity = otherVelo + tempforce/mass;
    angle+=(velocity/360000*2*PI);
    if (tempforce < 0.1){
     force = force*(1-damper+0.05);
     tempforce = -force;
     //velocity= -velocity*.7;
    }
    //if (tempforce > -0.1 && tempforce >0){
    // force = force*(1-damper);
    // tempforce = -force;      
    //}
    println(tempforce);
  }
  
  void render(){
    stroke(5);
    rotate(angle);    
    line(0,0,0,-lengt);
    translate(0,-lengt);    
  }
}
