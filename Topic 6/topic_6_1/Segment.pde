class Segment {
  float lengt, tempforce;
  float force, velocity, angle;
  float spring, damper, mass;
  Segment() {
    lengt = 15;
    tempforce = 0.2;
    velocity = 0;
    angle = 10;
    spring = 0.3;
    damper = 0.1;
    mass = 1;
  }

  void update(float otherVelo, float otherForce) {
    tempforce = -tempforce + otherForce; // make last segment stop --> revise formulas
    velocity = velocity + tempforce/mass;
    velocity = velocity - otherVelo;
    angle = angle + velocity;
    tempforce = velocity * damper + angle/spring;
   
  }


  void render() {
    stroke(5);
    rotate(angle);    
    line(0, 0, 0, -lengt);
    translate(0, -lengt);
  }
}
