class Firework {
  boolean boom;
  PVector pos;
  PVector speed;
  float size;
  float explodeTime;
  float angle;

  Firework(int xSize, int ySize) {
    pos = new PVector(random(100, xSize-100), 650);
    speed = new PVector(random(0, 4)-2, random(-6, -2));
    size = random(1, 3);
    explodeTime = ySize*random(.1,.8);
    angle = asin(speed.x/sqrt(pow(speed.x,2)+pow(speed.y,2)));
    boom = false;
  }

  void render() {
    fill(240,50,4);
    stroke(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 60*size, 5*size, 20*size);
    rect(0, 30*size, 20*size, 40*size);
    triangle(0, 0, 0-10*size, 0+10*size, 0+10*size, 0+10*size);

    popMatrix();
  }

  void update() {
    if (boom==false){
    pos.add(speed);
    }
    if (pos.y <= explodeTime){
      boom = true;
    }
  }
  
  boolean explosion(){
   return boom;
  }

  PVector position(){
    return pos;
  }
  
  float size(){
   return size; 
  }
}
