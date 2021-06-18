class Segment {
  float lengt, tempforce;
  float force, velocity, velocity2, angle;
  float spring, damper, mass;
  Segment() {
    lengt = -15;
    tempforce = (random(0,6)-3)/100;
    velocity = 0;
    velocity2 = 0;
    angle = 0;
    spring = 1;
    damper = 2;
    mass = 10;
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
    fill(0, 0, 200);
    noStroke();
    rotate(angle);    
    rect(0, 0, 4, -lengt);
    translate(0, -lengt);
  }
}
