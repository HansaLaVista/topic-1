// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021
 
int[] integers = new int[500];
int counter = 0;
for (int b=0; b<integers.length; b++) {
  integers[b]=int(random(0, 100));
  if (integers[b]>50) {
    counter++;
  }
}
println(counter);
