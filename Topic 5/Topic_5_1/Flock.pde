// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids
  Rock obstacle;


  Flock(Rock obstacles) {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
    //obstacle = new Rock(width/2,height/2);
    obstacle=obstacles;
 
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids,obstacle);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
  
  

}
