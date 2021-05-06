// Felipe Ramires & Hans Nielen - Algorithms for Create
// May 2021

int diceRoll() {                
  int numb = int(random(1, 7)); // random number between 1,7 for the 6 possible dice numbers
  return numb;         //return random value stored in the array
}
int[] counter= new int[6]; // array for the 6 dice numbers
boolean ready = false;     //boolean so it only runs once
void setup() {
  size(200, 200);         //setup for canvas and preset of arrays
  
  for (int i =0; i <6; i++) {
    counter[i] = 0;
  }
  for (int i = 0; i<1000000; i++) { // for loop to calculate occurances over 1 million dice rolls
  int temp = diceRoll();
  counter[temp-1]++;
  ready = true;
  }
}
void draw(){ 
  if(ready){
  Printer();      //call printer function
  ready = false;  //only runs once this way
  }
}

void Printer() {            // print the 6 different numbers and distrubution of each number
println("1:" + counter[0]); 
println("2:" + counter[1]);
println("3:" + counter[2]);
println("4:" + counter[3]);
println("5:" + counter[4]);
println("6:" + counter[5]);
}
  
