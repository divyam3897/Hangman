import QtQuick 2.3
import QtQuick.Window 2.2
import "hangman.js" as Mathfunction
Window
    {
     visible: true
     property string wordToFind:Mathfunction.chooseWord()
     property string res: Mathfunction.blanksFromAnswer(wordToFind)
   Image{
        id:wordImage
        width:Window.width
        height:Window.height
        source:"snowman-wallpaper-1.jpg"
        opacity:1
        }
   Rectangle{
        id:rec1

        width:Window.width/10
        height:Window.height/10
        border.color: "black"
        border.width: 5
          }
    TextInput{
    id:text1
    anchors.fill: rec1
    anchors.centerIn: rec1
    maximumLength: 1
    font.pixelSize: rec1.height/1.2
    font.bold:true
    font.capitalization: Font.AllUppercase
    Keys.onSpacePressed:{
           Mathfunction.chooseWord()
          console.log(wordToFind);
    }
    onAccepted:{
        text:Mathfunction.answer(text1.text,res,wordToFind)
        if(wordToFind.indexOf(text1.text)==-1){
        wordImage.opacity=wordImage.opacity - 0.2
       }

    }
    }
     Text{
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
    Text{
      id:text3
      anchors.centerIn: parent
      font.pixelSize: 20
      text:res
     }
    Text{
        anchors.centerIn: parent
        font.pixelSize: 20
       text: if(res.indexOf("_")==-1){
                 text3.text="CONGRATULATIONS!! Correct Answer"
              }
             }
    }




