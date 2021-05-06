int diceRoll() {
  int[] numbersprob = new int[7];
  numbersprob[0] = 1;      //set 7 possiblilities but 2 are the same outcome
  numbersprob[1] = 2;
  numbersprob[2] = 3;
  numbersprob[3] = 4;
  numbersprob[4] = 5;
  numbersprob[5] = 6;
  numbersprob[6] = 6;
  int numb = numbersprob[int(random(0,numbersprob.length))];
  return numb;    //return random value stored in the array, with more chance of 6
}

void Printer() {
  println("1:" + counter[0]);     //print the amount of times each number has been thrown
  println("2:" + counter[1]);
  println("3:" + counter[2]);
  println("4:" + counter[3]);
  println("5:" + counter[4]);
  println("6:" + counter[5]);
}

int[] counter= new int[6];  //set counter array
boolean ready = false;      //boolean so it only runs once
void setup() {
  size(200, 200);           //setup for canvas and preset of arrays
  for (int i =0; i <6; i++) {
    counter[i] = 0;
  }
  for (int i = 0; i<1000000; i++) {
    int temp = diceRoll();  //roll the dice a million times and count
    counter[temp-1]++;
    ready = true;
  }
}
void draw() {
  if (ready) {
    Printer();      //call printer function
    ready = false;  //only runs once this way
  }
}
