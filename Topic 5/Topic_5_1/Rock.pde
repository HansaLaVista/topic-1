class Rock {
  

PVector position;


Rock(float x, float y){

  position = new PVector(x,y);
   
}

void Display(){
  fill(0);
  ellipse(position.x,position.y,100,50);
  
  

}
  
  
  
  
  
}
