class MassDamper {
  Segment [] segments;
 Flower flower;
  int amount = 10;
  PVector startpos;
  MassDamper(int widt, int heigt){
    startpos = new PVector(widt/2, heigt/4*3);
    segments = new Segment [amount];
    flower = new Flower();
    for(int i = 0; i <amount; i++){
      segments[i] = new Segment();
    }
  }
  
  void update(){
      segments[0].update(0, segments[1].force);
    for(int i = 1; i<segments.length-1; i++){ 
      segments[i].update(segments[i-1].velocity, segments[i+1].force);
    }
      segments[segments.length-1].update(segments[segments.length-2].velocity, 0);
  }
  
  void render(){
    pushMatrix();
    translate(startpos.x, startpos.y);
    for(int i = 0; i<segments.length; i++){
      segments[i].render();
    }
    flower.RenderFlower();
    popMatrix();
  }
  
}
