var shownt;
function chooseWord(){
var words = ['cat', 'tree', 'swing', 'around', 'scientist'];
var x=Math.floor(Math.random() * words.length);
wordToFind=words[x];
}
function blanksFromAnswer(word){
var result =" ",i;
   for (i=0;i<word.length;i++){
      result = "_" + result;
    }
res=result;
}
function alterAt(n,c,originalString ){
var str1=originalString.slice(0,n);
var str2=originalString.slice(n+1,originalString.length);
var str=str1.concat(c,str2);
console.log(str1)
console.log(str2)
    res=str;
return str;
}
function answer(letter,shown,answer){
 var checkIndex = 0;
    console.log(answer)
   checkIndex = answer.indexOf(letter);
      while ( checkIndex >= 0 ) {
          shown = alterAt(checkIndex,letter,res);
          checkIndex = answer.indexOf(letter,checkIndex + 1);
      }
  return shown;
}
