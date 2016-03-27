import QtQuick 2.3
import QtQuick.Window 2.2
import "hangman.js" as Mathfunction
Window
    {
     visible: true
     property string wordToFind:Mathfunction.chooseWord()

   Image{
        id:wordImage
        width:Window.width
        height:Window.height
        source:"../snowman-wallpaper-1.jpg"
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
    font.pixelSize: (rec1.height*rec1.width)/80
    font.bold:true
    font.capitalization: Font.AllUppercase
    Keys.onSpacePressed:
    {        chooseWord()
console.log(wordToFind);
    }
    onAccepted:
       {
        text:Mathfunction.answer(text1.text,Mathfunction.blanksFromAnswer(wordToFind),wordToFind)
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
   text:Mathfunction.blanksFromAnswer(wordToFind)

}
  TextInput{
      anchors.centerIn: parent
      font.pixelSize: 20
      onFocusChanged:  {
      text=Mathfunction.answer(text1.text,shown,wordToFind)
    }}
}

