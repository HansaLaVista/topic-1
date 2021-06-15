class MassDamper {
  Segment [] segments;
  flower flower;
  int amount = 12;
  PVector startpos;
  MassDamper(int widt, int heigt) {
    startpos = new PVector(widt/2, heigt/4*3);
    segments = new Segment [amount];
    flower = new flower();
    for (int i = 0; i <amount; i++) {
      segments[i] = new Segment();
    }
  }

  void update() {
    segments[segments.length-1].update(segments[segments.length-2].velocity, 0);
    
    for (int i = segments.length-2; i>0; i--) { 
      segments[i].update(segments[i-1].velocity, segments[i+1].tempforce);
    }
    segments[0].update(0, segments[1].tempforce);
  }

  void render() {
    pushMatrix();
    translate(startpos.x, startpos.y);
    for (int i = 0; i<segments.length; i++) {
      segments[i].render();
    }
    flower.RenderFlower(); // top flower part
    popMatrix();
  }
}
