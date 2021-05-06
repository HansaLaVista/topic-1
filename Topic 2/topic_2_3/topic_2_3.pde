// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021

blueDot[] Dot = new blueDot[250]; // array of the object blueDot


void setup() { // setting up size of canvas and initializing the array of blue dots

  size(400, 400);
  background(255);
  for (int i = 0; i < Dot.length; i++) {
    
    Dot[i] = new blueDot(width, height);
  }
}


void draw() { // displaying the background and the blue dots

  background(255);

  for (int i = 0; i < Dot.length; i++) { 

    Dot[i].blueDotDisplay(); 
  }
}
