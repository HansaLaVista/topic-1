// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021

blueDot[] Dot = new blueDot[250];


void setup() {

  size(400, 400);
  background(255);

  
  for (int i = 0; i < Dot.length; i++) {
    
    Dot[i] = new blueDot(width, height);
  }
}


void draw() {

  background(255);

  for (int i = 0; i < Dot.length; i++) {

    Dot[i].blueDotDisplay();
  }
}
