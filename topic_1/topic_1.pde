char [] word = {'D','O','N','T',' ','I',' ','T','N','O','D'};
int counter = 0;
boolean isPalindrome = true;
for(int a=word.length-1 ; a>=0 ; a--){
  if(word[a]!=word[word.length-a-1]){
   isPalindrome = false;
   break;
  }
}
if(isPalindrome){println("Palindrome");}
else { println("Not Palindrome");}
