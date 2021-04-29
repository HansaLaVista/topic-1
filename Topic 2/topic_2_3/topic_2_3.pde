// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021

blueDot[] blueDot = new blueDot[1000];


void setup() {

  size(400, 400);


  for (int i = 0; i < blueDot.length; i++) {

    blueDot[i] = new blueDot(random(0,400),random(0,400));
  }
}


void draw() {

  background(255);

  for (int i = 0; i < blueDot.length; i++) {

    blueDot[i].blueDotDisplay();
  }
}
