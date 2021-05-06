// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021
float xoff, yoff = 0.0;    //set global variables for the positions in noispace
float xincrement = 0.01;   //set the increments for the y and x coordinate in noisespace
float yincrement = 0.015; 

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0, 0, width, height);  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;  //assign xcoordinate
  float m = noise(yoff)*height; //assign y coordinate

  // With each cycle, increment xoff
  xoff += xincrement;    //update coordinates in noise space
  yoff += yincrement;

  // Draw the ellipse at the value produced by perlin noise
  fill(200);              //assign color and draw the circle
  ellipse(n, m, 64, 64);
}
