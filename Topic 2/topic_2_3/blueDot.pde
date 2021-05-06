class blueDot { 


  PVector Pos; // variables for dot position and size
  float gSize;


  blueDot(int wit, int heit) {    // blue dot constructor
    Pos =gaussianPos(wit, heit);  // Pos gets the values from the gaussianPos function
    gSize = gaussianSize();      // gSize gets the values from the gaussianSize function
  }


  void blueDotDisplay() { 
    // display the blue dots with the values of the gaussian position and size
    fill(0, 0, 200);
    noStroke();
    ellipse(Pos.x, Pos.y, gSize, gSize);
  }
  
  PVector gaussianPos(int widt, int heigt) { // function for the position using Pvector
    float sd = 60;
    float xgaus = (randomGaussian() * sd) + widt/2;
    float ygaus = (randomGaussian() * sd) + heigt/2;
    PVector position = new PVector(xgaus, ygaus); // 
    return position;
  }
  
  float gaussianSize() {  // functin for the dot size
    float sd = 8;
    float size = (randomGaussian()*sd) + 10;
    return size;
  }
}
