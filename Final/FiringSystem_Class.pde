class FiringSystem {

  int amount;
  Spark [] sparks;
  boolean started=false;


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
      }
    }
  }
  
  void begin(PVector pos, float fSize) { // initiates the system 
    started = true;                     // true for the explosion
    sparks = new Spark [amount];
    for (int i = 0; i<amount; i++) {
      sparks[i] = new Spark(pos, fSize);
    }
  }
}
