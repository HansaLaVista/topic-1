int diceRoll() {
  int[] numbersprob = new int[7];
  numbersprob[0] = 1;
  numbersprob[1] = 2;
  numbersprob[2] = 3;
  numbersprob[3] = 4;
  numbersprob[4] = 5;
  numbersprob[5] = 6;
  numbersprob[6] = 6;
  int numb = numbersprob[int(random(0,numbersprob.length))];
  return numb;
}

void Printer() {
  println("1:" + counter[0]); 
  println("2:" + counter[1]);
  println("3:" + counter[2]);
  println("4:" + counter[3]);
  println("5:" + counter[4]);
  println("6:" + counter[5]);
}

int[] counter= new int[6];
boolean ready = false;
void setup() {
  size(200, 200);   
  for (int i =0; i <6; i++) {
    counter[i] = 0;
  }
  for (int i = 0; i<1000000; i++) {
    int temp = diceRoll();
    counter[temp-1]++;
    ready = true;
  }
}
void draw() {
  if (ready) {
    Printer();
    ready = false;
  }
}
