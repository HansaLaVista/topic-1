class Firework{
    PVector pos;
    PVector speed;
    float size;
    int explodeTime;
    float angle;
  
  Firework(int xSize, int ySize){
    pos = new PVector(random(100, xSize-100),650);
    speed = new PVector(random(0,4)-2,random(-6,-2));
    size = random(1, 3);
    explodeTime = 2;
    angle = ((speed.x/speed.y)/180)*PI;
  }
  
  void render(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(angle);
   triangle(pos.x,pos.y,pos.x-10*size,pos.y+10*size,pos.x+10*size,pos.y+10*size);
   popMatrix();
  }
  
  void update(){
   pos.add(speed);
  }
  
  
  
}
