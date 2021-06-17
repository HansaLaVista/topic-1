class ParticleSystem {
  
// variables for the particle system
  Particle [] particles; // creating array of partciles 
  int amount;
  boolean started=false;
  int type;
  
  ParticleSystem() { // partcile system constructor
    type = int(random(0, 2));
    amount = 100; // amount of particles in the explosion
  }

  void update() { // function that calls particle update, gives the particles a random velocity
    if (started) {
      for (int i = 0; i<amount; i++) {
        particles[i].particleUpdate();
      }
    }
  }

  void render() { // render the particles in the explosion
    if (started) {
      for (int i = 0; i<amount; i++) {
        particles[i].particleRender();
      }
    }
  }

  void begin(PVector pos, float fSize) { // initiates the system 
    started = true;
    particles = new Particle [amount];

    for (int i = 0; i<amount; i++) {
      particles[i] = new Particle(pos, fSize);
    }
  }
}
