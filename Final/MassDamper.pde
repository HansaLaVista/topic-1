class MassDamper {
  Segment [] segments;
  color hairColor;

  int amount = int(randomGaussian()*2.5) +20;
  PVector startpos;
  MassDamper(float widt, float heigt) {
    startpos = new PVector(widt, 0*heigt);
    segments = new Segment [amount];
      hairColor = color(0,0,int(randomGaussian()*50+205));    
    for (int i = 0; i <amount; i++) {
      segments[i] = new Segment(hairColor);
    }
  }

  void update() {
    segments[segments.length-1].update(segments[segments.length-2].velocity, 0);
    
    for (int i = segments.length-2; i>0; i--) { 
      segments[i].update(segments[i-1].velocity, segments[i+1].tempforce);
    }
    segments[0].update(0, segments[1].tempforce);
    if (abs(segments[segments.length-1].tempforce) <= pow(10,-5)){
      segments[segments.length-1].tempforce += (randomGaussian()*.2 - .5);
    }
  }

  void render() {
    pushMatrix();
    translate(startpos.x, startpos.y);
    for (int i = 0; i<segments.length; i++) {
      segments[i].render();
    }

    popMatrix();
  }
  void force(float i){
    //if (segments[segments.length-2].tempforce >0){
    segments[segments.length-1].tempforce += i;}
    //else {segments[segments.length-2].tempforce += -i;}
  //}
}
