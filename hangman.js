var shown;
function chooseWord(){
var words = ['cat', 'tree', 'swing', 'around', 'scientist'];
var x=Math.floor(Math.random() * words.length);
wordToFind=words[x];
}
function blanksFromAnswer(word){
var result =" ",i;
   for (i=0;i<word.length;i++){
      result = "_ " + result;
    } shown=result;
return result;
}
function alterAt(n,c,originalString ){
  var str1=originalString.substr(0,n);
var str2=originalString.substr(n+1,originalString.length);
var str=str1.concat(c,str2);
console.log(str1)
console.log(str2)

return str;
}
function answer(letter,shown,answer){
console.log(answer)
var checkIndex = 0;
   checkIndex = answer.indexOf(letter);
      while ( checkIndex >= 0 ) {
          shown = alterAt(checkIndex,letter,answer);
          checkIndex = answer.indexOf(letter,checkIndex + 1);
}
  return shown;
}
