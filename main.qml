import QtQuick 2.3
import QtQuick.Window 2.2
import "hangman.js" as Mathfunction
Window
    {

    visible: true

   function chooseWord ()
    {
     var words = ['cat', 'tree', 'swing', 'around', 'scientist'];
     var x=Math.floor(Math.random() * words.length);
     console.log(words[x]);
     return words[x];
   }

    function blanksFromAnswer ( answerWord )
    {
    var result = " ";
    var i;
         for (i=0;i<answerWord.length;i++)
         {
           result = "_ " + result;
         }
      return result;
   }

    function alterAt ( n, c, originalString )
    {
       return originalString.substr(0,n) + c + originalString.substr(n+1,originalString.length);
   }

    function answer(letter,shown,answer)
    {
    var checkIndex = 0;
    checkIndex = answer.indexOf(letter);
           while ( checkIndex >= 0 ) {
               shown = alterAt( checkIndex, letter, answer);
               checkIndex = answer.indexOf(letter, checkIndex + 1);
    }
       return shown;
    }

    Image
    {
        id:wordImage
        width:Window.width
        height:Window.height
        source:"../snowman-wallpaper-1.jpg"
        opacity:1
    }
   Rectangle
   {
        id:rec1
        width:Window.width/15
        height:Window.height/10
        border.color: "black"
        border.width: 5
   }
    TextInput
   {
    id:text1
    anchors.fill: rec1
    maximumLength: 1
    font.pixelSize: 45
    font.bold:true
    font.capitalization: Font.AllUppercase
    Keys.onSpacePressed:
    {
         chooseWord()

    }
     Keys.onEnterPressed:
       {
         text:" "
       wordImage.opacity=wordImage.opacity - 0.1
       }
    }
     Text
      {
      text:"Guesses"
     color:'red'
     anchors.left: rec1.right
     font.pixelSize:Window.height/15
      }
   Behavior on opacity
       {
    PropertyAnimation
   {
     duration: 100
   }
       }
Text
    {
   anchors.centerIn: parent
   font.pixelSize: 20
   text: blanksFromAnswer(chooseWord())
Keys.onEnterPressed:
    {
     text: answer(text1.text,blanksFromAnswer(),chooseWord())
    }
}
}
