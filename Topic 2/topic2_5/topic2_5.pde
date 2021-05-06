float xoff, yoff = 0.0;
float xincrement = 0.01;
float yincrement = 0.015; 

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float m = noise(yoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  yoff += yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n,m, 64, 64);
}
