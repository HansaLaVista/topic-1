class FiringSystem {

  int amount;
  Spark [] sparks;
  boolean started=false;
  float size;

  FiringSystem() {
    amount = 100;
  }


  void render() { // render the particles in the explosion
    if (started) {
      for (int i = 0; i<amount; i++) {
        sparks[i].sparksRender();
      }
    }
  }
  
    void update() {   // function that calls particle update
    if (started) { 
      for (int i = 0; i<amount; i++) {
        sparks[i].sparksUpdate();
        if (sparks[i].alpha < 10){
          sparks[i] = new Spark(15);
        }
      }
    }
  }
  
  void begin(PVector pos, float fSize, float angle) { // initiates the system 
    started = true;                     // true for the explosion
    size = -fSize;
    sparks = new Spark [amount];
    for (int i = 0; i<amount; i++) {
      sparks[i] = new Spark(size);
    }
  }
}
