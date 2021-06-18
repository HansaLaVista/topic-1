class Segment {
  float lengt, tempforce, thickness;
  float force, velocity, velocity2, angle;
  float spring, damper, mass;
  color hairColor;
  Segment(color colour) {
    lengt = -15;
    thickness = 6;
    tempforce = (randomGaussian()*.2 );
    velocity = 0;
    velocity2 = 0;
    angle = 0;
    spring = 1;
    damper = 1;
    mass = 10;
    hairColor = colour;
  }

  void update(float otherVelo, float otherForce) {
    tempforce = -tempforce + otherForce; 
    velocity = velocity + tempforce/mass;
    velocity2 = velocity - otherVelo;
    angle = angle + velocity2;
    tempforce = velocity2*damper + angle/spring;
   //  println(tempforce);
  }

  void render() {
    fill(hairColor);
    noStroke();
    rotate(angle);    
    rect(0, 0, thickness, -lengt);
    translate(0, -lengt-1);
  }
}
