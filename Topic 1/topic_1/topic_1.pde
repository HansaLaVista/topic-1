// Felipe Ramires and Hans Nielen for Algorithms in Create
// April 2021

void setup(){
  
}

void draw(){
 char [] input = {'H','A','N','N','A','H'};
 while(millis()<2000){
 normalWrite(input);
 backwardsWrite(input);
 println(eCounter(input));
 palinCheck(input);
 }
}

void normalWrite(char[] word){
  for(int b=0;b<word.length;b++){
    println(word[b]);
  }
}
void backwardsWrite(char[] word){
 for(int c=word.length-1; c>=0; c--){
   println(word[c]);
 }
}
int eCounter(char[] word){
  int counter = 0;
    for(int d=0;d<word.length;d++){
    if(word[d]=='E'){
     counter++; 
    }
  }
  return counter;
}
void palinCheck(char[] word){
boolean isPalindrome = true;
for(int a=word.length-1 ; a>=0 ; a--){
  if(word[a]!=word[word.length-a-1]){
   isPalindrome = false;
   break;
  }
}
if(isPalindrome){println("Palindrome");}
else { println("Not Palindrome");}
}
