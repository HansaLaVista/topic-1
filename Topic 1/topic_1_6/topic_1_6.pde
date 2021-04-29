// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021

String binNumb = "11010101";
int decNumb = 0;
for (int i = 0; i< binNumb.length(); i++) {
  if(binNumb.charAt(i)=='1'){
    decNumb = decNumb + int(pow(2,binNumb.length()-1-i));
  }
}
println(decNumb);
