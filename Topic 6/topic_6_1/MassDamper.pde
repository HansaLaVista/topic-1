class MassDamper {
  Segment [] segments;
  int amount = 10;
  PVector startpos;
  MassDamper(int widt, int heigt){
    startpos = new PVector(widt/2, heigt/4*3);
    segments = new Segment [amount];
    for(int i = 0; i <amount; i++){
      segments[i] = new Segment();
    }
  }
  
  void update(){
    for(int i = 1; i<amount-1; i++){
      segments[i].update(segments[i-1].velocity, segments[i+1].force);
    }
  }
  
  void render(){
    pushMatrix();
    translate(startpos.x, startpos.y);
    for(int i = 0; i<amount; i++){
      segments[i].render();
    }
    popMatrix();
  }
  
}
