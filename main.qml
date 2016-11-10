import QtQuick 2.3
import QtQuick.Window 2.2

import QtQuick.Controls 1.4

import "library.js" as Library

Window {
    id:main
    visible: true
    width: 480
    height: 272
    title: qsTr("Javascript Test")

    property var peopleName;
    property var age;
    property var people;
    property var peopleOld;

    StackView {
        id: stackTop
        initialItem: view
        width:480
        height:173
        Component {
            id: view
            MouseArea {
                id: mouseArea1
                x: 8
                y: 6
                width: 464
                height: 173
            }
        }
    }

    //Button

    Rectangle{
        id: rectangleA
        x: 8
        y: 185
        width: 116
        height: 79
        color: "#ff0404"
        border.color: "#ffffff"
        MouseArea{
            id: mouseAreaName
            anchors.fill: parent
            onClicked: {
                peopleName=Library.getPeopleNames()
                stackTop.push(Qt.resolvedUrl("peopleNames.qml"))
                console.log(Library.getPeopleNames())
            }
        }
        Text {
            id: text1
            x: 50
            y: 33
            width: 4
            height: 14
            text: qsTr("A")
            anchors.centerIn: parent
            font.pixelSize: 12
            color: '#ffffff'
        }
    }
    Rectangle {
        id: rectangleB
        x: 123
        y: 185
        width: 116
        height: 79
        color: "#40bc03"
        border.color: "#ffffff"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                age=Library.getPeopleAges()
                stackTop.push(Qt.resolvedUrl("peopleAges.qml"))
                console.log(Library.getPeopleAges())
            }
        }
        Text {
            id: text2
            x: 45
            y: 33
            width: 9
            height: 12
            text: qsTr("B")
            anchors.centerIn: parent
            font.pixelSize: 12
            color: '#ffffff'
        }
    }
    Rectangle {
        id: rectangleC
        x: 239
        y: 185
        width: 116
        height: 79
        color: "#0438f2"
        border.color: "#ffffff"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                people=JSON.stringify(Library.getAllPeople())
                stackTop.push(Qt.resolvedUrl("allPeople.qml"))
                console.log(JSON.stringify(Library.getAllPeople()))
            }
        }
        Text {
            id: text3
            x: 45
            y: 33
            text: qsTr("C")
            anchors.centerIn: parent
            font.pixelSize: 12
            color: '#ffffff'
        }
    }
    Rectangle {
        id: rectangleD
        x: 356
        y: 185
        width: 116
        height: 79
        color: "#ca07ca"
        border.color: "#ffffff"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                stackTop.push(Qt.resolvedUrl("allPeopleOld.qml"))
                console.log(JSON.stringify(Library.getOldPeople()))
                peopleOld=JSON.stringify(Library.getOldPeople())
                //console.log(peopleOld)
            }
        }

        Text {
            id: text4
            x: 45
            y: 33
            text: qsTr("D")
            anchors.centerIn: parent
            font.pixelSize: 12
            color: '#ffffff'
        }
    }
}
