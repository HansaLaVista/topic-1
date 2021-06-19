
class Segment {
  float lengt, thickness;                               // variables for visual aspects 
  float force,tempForce, velocity, velocity2, angle;   // MDS physics variables
  float spring, damper, mass;                         // MDS physics variables
  color hairColor; 
  
  Segment(color colour) {      // colour variable for unifrom color throughout whole segment
    lengt = -15;              // initializing variables
    thickness = 6;
    tempForce = (randomGaussian()*.2 );
    velocity = 0;
    velocity2 = 0;
    angle = 0;
    spring = 1;
    damper = 1;
    mass = 10;
    hairColor = colour;
  }

  void update(float otherVelo, float otherForce) { // passing velocity and force to the update
    tempForce = -tempForce + otherForce;          // DMS physics equations
    velocity = velocity + tempForce/mass;
    velocity2 = velocity - otherVelo;           // 2nd velocity was needed to pass the velocity to the next segment
    angle = angle + velocity2;
    tempForce = velocity2*damper + angle/spring;
    
    if(tempForce>.5){ // setting a limit for the force
      tempForce = .5;
    }
  }

  void render() { // display of the segment
    fill(hairColor);
    noStroke();
    rotate(angle);    
    rect(0, 0, thickness, -lengt);
    translate(0, -lengt-1);
  }
}
