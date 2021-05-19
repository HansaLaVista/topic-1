class ParticleSystem {

  Particle [] particles;
  int amount;
  boolean started=false;
  boolean trail;
  int type;
  ParticleSystem() {
    type = int(random(0, 2));
    amount = 100;
  }

  void update() {
    if (started) {
      for (int i = 0; i<amount; i++) {
        particles[i].particleUpdate();
      }
    }
  }

  void render() {
    if (started) {
      for (int i = 0; i<amount; i++) {
        particles[i].particleRender();
      }
    }
  }

  void begin(PVector pos, float fSize) {
    started = true;
    particles = new Particle [amount];

    for (int i = 0; i<amount; i++) {
      particles[i] = new Particle(pos, fSize);
    }
  }
  void begin(PVector pos, float fSize, int p) {
    particles = new Particle [amount];
    started = true;
    for (int i = 0; i<amount; i++) {
      particles[i] = new Particle(pos, fSize, p);
    }
  }
}
