// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Demonstration of Craig Reynolds' "Flocking" behavior
// See: http://www.red3d.com/cwr/
// Rules: Cohesion, Separation, Alignment

// Click mouse to add boids into the system

Flock flock;
Rock obstacle; // rock that flock should avoid

void setup() {
  size(600,300);
  obstacle = new Rock(width/2,height/2); // position of the rock
  flock = new Flock(obstacle);
  // Add an initial set of boids into the system
  
  for (int i = 0; i < 20; i++) {
    Boid b = new Boid(width/3,height/3);
    flock.addBoid(b);
  }
}

void draw() {
  background(0,128,128);
  flock.run();
  obstacle.Display(); // display the rock

  
  
  // Instructions
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
