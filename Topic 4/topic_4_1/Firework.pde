class Firework {
  boolean boom=false;
  PVector pos;
  PVector speed;
  float size;
  float explodeTime;
  float angle;

  Firework(int xSize, int ySize) {
    pos = new PVector(random(100, xSize-100), 650);
    speed = new PVector(random(0, 4)-2, random(-6, -2));
    size = random(1, 3);
    explodeTime = ySize/.8;
    angle = asin(speed.x/sqrt(pow(speed.x,2)+pow(speed.y,2)));
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    triangle(0, 0, 0-10*size, 0+10*size, 0+10*size, 0+10*size);
    popMatrix();
  }

  void update() {
    pos.add(speed);
    if (pos.y >= explodeTime){
      boom = true;
    }
  }
  
  boolean explosion(){
   if (boom);
   return true;
  }
}
