
class MassDamper {
  Segment [] segments; // array of the object segment
  color hairColor;  
  int amount = int(randomGaussian()*2.5) +20; // random amount of segments per tentacle
  PVector startpos; 
  boolean swingLeft, swingRight;             // swinging movement of the tentacles
  
  MassDamper(float widt, float heigt) {
    startpos = new PVector(widt, 0*heigt);
    segments = new Segment [amount];
      hairColor = color(0,0,int(randomGaussian()*50+205));  // random color for each tentacle
  
    for (int i = 0; i <amount; i++) {
      segments[i] = new Segment(hairColor);
    }
  }

  void update() {
    segments[segments.length-1].update(segments[segments.length-2].velocity, 0); // making sure last segment also gets the force and velocity
    
    for (int i = segments.length-2; i>0; i--) {                                 // inverted array for passing velocity and force throught the segments
      segments[i].update(segments[i-1].velocity, segments[i+1].tempForce);
    }
    segments[0].update(0, segments[1].tempForce);                             // making sure first segment also gets the force and velocity
    
    if (abs(segments[segments.length-1].tempForce) <= pow(10,-5)){           // function of force (wind) on the tentacles.
      segments[segments.length-1].tempForce += (randomGaussian()*.2 - .5);  //  the tentacles will continue to move 
    }
    move();
  }

  void render() {                    // render the tentacles
    pushMatrix();
    translate(startpos.x, startpos.y);
    for (int i = 0; i<segments.length; i++) {
      segments[i].render();
    }
    popMatrix();
  }
  void move(){          // method for the swinging of the tentacles
    if (swingLeft){
      segments[segments.length-1].tempForce += .008;
    }
    if (swingRight){
      segments[segments.length-1].tempForce += -.008;
    }
  }
  void moveCheck(char a){ // based on the key press, tentacle will movw slightly to the left or right
    if (a == 'a'){
      swingRight = true;
    }
    if (a == 'd'){
      swingLeft = true;
    }
  }
  void haltCheck(char a){   // booleans are set to false if the keys are not pressed, not moving
    if (a == 'a'){
      swingRight = false;
    }
    if (a == 'd'){
      swingLeft = false;
    }    
  }
}
