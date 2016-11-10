import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

import "library.js" as Library

Rectangle {
    x: 0
    y: 0
    width: 464
    height: 173
    property var people: main.people

    function getName(position)
    {
        if(people)
        {
            if(people.length > position)
            {
                if(people[position].name){
                    return people[position].name
                }
                else{
                    return "Name not available"
                }
//                return people[position].name

            }
            else
            {
                return "Position does not exist"
            }
        }
        else
        {
            return "Not defined"
        }
    }

    function getAge(position)
    {
        if(people)
        {
            if(people.length > position)
            {
                if(people[position].age){
                    return people[position].age
                }
                else{
                    return "Age not available"
                }
//                return people[position].age
            }
            else
            {
                return "Position does not exist"
            }
        }
        else
        {
            return "Not defined"
        }
    }

    function getModelNumber()
    {
        if(people)
        {
            return people.length
        }
        else
        {
            return 0
        }
    }

    Component{
        id: delegateComponent
        Rectangle{
            width: 464
            height: 50
            color: "#ff8833"
            border.width: 2
            border.color: "red"
            Row{
                spacing: 5
                anchors.centerIn: parent
                Rectangle{
                    width: 150
                    height: 30
                    color: "#ffffff"
                    border.width: 2
                    border.color: "black"

                    Text{ anchors.centerIn: parent; text: getName(index); width: 140; font.pixelSize: 14}
                }

                Rectangle{
                    width: 150
                    height: 30
                    color: "#ffffff"
                    border.width: 2
                    border.color: "black"

                    Text{ anchors.centerIn: parent; text: getAge(index); width: 140; font.pixelSize: 14}
                }
            }
        }
    }

    ListView{
        id: visor
        width: 464
        height: 173
        anchors.centerIn: parent
        model: getModelNumber()
        delegate: delegateComponent
        spacing: 10
    }
}
