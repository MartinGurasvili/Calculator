import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
//import Modern_Calculator


import cal

Window {
    id: mainWindow
    width: 250
    height: 355
    opacity: 0.9
    flags: Qt.Window | Qt.FramelessWindowHint |Qt.WindowStaysOnTopHint
    visible: true
    minimumWidth: 250
    minimumHeight: 355
    maximumWidth: 250
    maximumHeight: 355
    title: ""
    property int previousX
    property int previousY
    property string anser: "0"
    property string formula: ""
    property color c1: "#000000"
    property color c2: "#000000"
    //property string ff:"Rounded Sans Serifs"
    property string ff:"Helvetica Neue"


    color: "#00000000"
    Bridge {
            id: bridge
        }




    Rectangle {
        radius: 40
            width: parent.width
            height: parent.height/3.5
            opacity: 1

            anchors.top: parent.top



            MouseArea {
                opacity: 1
                anchors.fill: parent
                anchors.bottomMargin: -43

                onPressed: {
                    previousX = mouseX
                    previousY = mouseY
                }

                onMouseXChanged: {
                    var dx = mouseX - previousX
                    mainWindow.setX(mainWindow.x + dx)
                }

                onMouseYChanged: {
                    var dy = mouseY - previousY
                    mainWindow.setY(mainWindow.y + dy)
                }

            }

    }


    Rectangle {
        id: maini
        x: 0
        y: 0
        radius: 20
        width: 250
        height: parent.height
        opacity: 1
        border.width: 0
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: c1
            }


            GradientStop {
                position: 1
                color: c2
            }
        }


        RoundButton {
            id: roundButton
            x: 195
            y: 8
            width: 20
            height: 20
            visible: true

            text: "—"
            font.pointSize: 13
            font.family: ff
            layer.mipmap: false
            layer.enabled: false
            layer.format: ShaderEffectSource.RGBA
            focusPolicy: Qt.ClickFocus
            //spacing: 9
            //display: AbstractButton.IconOnly
            clip: false
            highlighted: false
            flat: false
            onClicked:mainWindow.showMinimized()

            QtObject{
                id:buts
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(roundButton){
                                               roundButton.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 7
                color: buts.dynamicColor
            }



        }

        RoundButton {
            id: roundButton1
            x: 221
            y: 8
            width: 20
            height: 20
            visible: true
            radius: 7
            text: "X"
            font.pointSize: 12
            clip: false
            layer.format: ShaderEffectSource.RGBA
            layer.mipmap: false
            flat: false
            font.family: ff
            focusPolicy: Qt.ClickFocus
            //spacing: 9
            highlighted: false
            layer.enabled: false
            onClicked:Qt.quit()
            QtObject{
                id:butsss
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(roundButton1){
                                               roundButton1.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 7
                color: butsss.dynamicColor
            }

        }

        Text {
            id: ans
            x: 8
            y: 28
            width: 234
            height: 53
            color: "#000000"
            text: anser

            fontSizeMode: Text.Fit
            minimumPixelSize: 5
            font.pixelSize: 45

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            //font.styleName: "Bold"
            font.family: ff
            Rectangle {
                id: screen1
                x: 99
                y: 22
            }

        }

        TextInput {
            id: form
            x: 8
            y: 78
            width: 227
            height: 20
            color: "#99000000"
            text: formula
            maximumLength:27
            selectByMouse :true
            focus: true
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.family: ff
            font.pixelSize: 15

            onTextChanged: {
                formula = text
                anser = bridge.up(formula)
                if(formula == "")
                {
                    anser = "0"
                }
            }
        }

        RoundButton {
            id: clear
            x: 126
            y: 104
            width: 57
            height: 47
            opacity: 1
            visible: true
            radius: 15
            text: qsTr("AC")
            highlighted: false
            flat: false
            font.family: ff
            font.pointSize: 15
            onPressed:{
                formula = ""
                anser = "0"
            }
            QtObject{
                id:butssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(clear){
                                               clear.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssss.dynamicColor
            }


        }

        RoundButton {
            id: back
            x: 185
            y: 104

            width: 57
            height: 47
            radius: 15
            text: qsTr("⌫")
            //font.bold: true
            font.pointSize: 20
            font.family: ff
            onPressed:{
                formula = bridge.back(formula)

            }
            QtObject{
                id:butss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(back){
                                               back.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butss.dynamicColor
            }

        }

        RoundButton {
            id: rbrack
            x: 67
            y: 104
            width: 57
            height: 47
            radius: 15
            text: qsTr(")")
            //font.bold: true
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:butsssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(rbrack){
                                               rbrack.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: lbrack
            x: 8
            y: 104
            width: 57
            height: 47
            radius: 15
            text: qsTr("(")
            //font.bold: true
            font.family: ff
            font.pointSize: 17
            QtObject{
                id:butssssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(lbrack){
                                               lbrack.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: divide
            x: 185
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("÷")
            font.pointSize: 25
            font.family: ff
            QtObject{
                id:butsssssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(divide){
                                               divide.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssss.dynamicColor
            }
            onPressed:{
                formula = formula+"/"
            }
        }

        RoundButton {
            id: nine
            x: 126
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("9")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(nine){
                                               nine.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: eight
            x: 67
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("8")
            highlighted: false
            flat: false
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butsssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(eight){
                                               eight.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: seven
            x: 8
            y: 153
            width: 57
            height: 47
            radius: 15
            text: qsTr("7")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(seven){
                                               seven.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: times
            x: 185
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("X")
            font.pointSize: 17
            font.family: ff
            QtObject{
                id:butsssssssssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(times){
                                               times.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+"*"
            }
        }

        RoundButton {
            id: six
            x: 126
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("6")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butsssssssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(six){
                                              six.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }


        }

        RoundButton {
            id: five
            x: 67
            y: 202
            width: 57
            height: 47
            radius: 15
            text: "5"
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butssssssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(five){
                                              five.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: four
            x: 8
            y: 202
            width: 57
            height: 47
            radius: 15
            text: qsTr("4")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butsssssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(four){
                                              four.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: minus
            x: 185
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("—")
            font.pointSize: 17
            font.family: ff

            QtObject{
                id:butssssssssssss
                property string colorDefult :"#2f2f2f2f"
                property var dynamicColor: if(minus){
                                               minus.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+"-"
            }
        }

        RoundButton {
            id: three
            x: 126
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("3")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butssssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(three){
                                              three.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }


        RoundButton {
            id: two
            x: 67
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("2")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butsssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(two){
                                              two.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: one
            x: 8
            y: 251
            width: 57
            height: 47
            radius: 15
            text: qsTr("1")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butsssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(one){
                                              one.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: plus
            x: 185
            y: 300
            width: 57
            height: 47
            radius: 15
            text: qsTr("+")
            font.pointSize: 22
            font.family: ff
            QtObject{
                id:butsssssssssssss
                property string colorDefult :"#1f1f1f1f"
                property var dynamicColor: if(plus){
                                              plus.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butsssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: decimal
            x: 126
            y: 300
            width: 57
            height: 47
            radius: 15
            text: qsTr(".")
            font.family: ff
            font.pointSize: 30
            QtObject{
                id:butssssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(decimal){
                                              decimal.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

        RoundButton {
            id: zero
            x: 8
            y: 300
            width: 116
            height: 47
            radius: 15
            text: qsTr("0")
            font.family: ff
            font.pointSize: 20
            QtObject{
                id:butssssssssssssss
                property string colorDefult :"#0a0a0a0a"
                property var dynamicColor: if(zero){
                                              zero.down ? "#f1f1f1f1":colorDefult
                                           }
            }
            background: Rectangle
            {
                radius: 15
                color: butssssssssssssss.dynamicColor
            }
            onPressed:{
                formula = formula+text
            }
        }

    }




}



