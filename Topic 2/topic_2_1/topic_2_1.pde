int diceRoll() {
  int numb = int(random(1, 7));
  return numb;
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
void draw(){
  if(ready){
  Printer();
  ready = false;
  }
}

void Printer() {
println("1:" + counter[0]); 
println("2:" + counter[1]);
println("3:" + counter[2]);
println("4:" + counter[3]);
println("5:" + counter[4]);
println("6:" + counter[5]);
}
  
