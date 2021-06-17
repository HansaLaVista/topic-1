//Felipe Ramires & Hans Nielen
//Topic 6 Mass-spring-damper system
//assignment 6.1
MassDamper [] grass ;
int amount = 10;

void setup(){
  size(700,350);
 // flower =  new MassDamper(width, height);
   grass = new MassDamper [amount];
   
   for (int i = 0; i<amount; i++) {
      grass[i] = new MassDamper((random(0,width)),height);
    }
}

void draw(){
  background(100,100,255);
  fill(100,255,100);
  noStroke();
  rect(0, height*0.75, width, height/4);
  
   for (int i = 0; i <amount; i++) {
       grass[i].render();
       grass[i].update();
    }

}
