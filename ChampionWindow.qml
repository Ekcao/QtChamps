import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: champion
    property var champModel
    width: mainInfo.width + 16; height: mainInfo.height + 16

    Rectangle {
        id: mainInfo
        anchors.centerIn: parent
        width: childrenRect.width; height: childrenRect.height

        Image {
            id: portrait
            width: 100; height: 100
            source: Riot.dataDragonPortrait + champModel.image.full
        }

        Text {
            id: name
            anchors.left: portrait.right
            anchors.leftMargin: 8
            text: champModel.name
            font.pixelSize: 24
            font.bold: true
        }

        Text {
            id: title
            anchors.left: name.left
            anchors.top: name.bottom
            text: champModel.title
            font.pixelSize: 14
        }

        ListView {
            anchors.top: portrait.bottom
            anchors.topMargin: 16
            boundsBehavior: Flickable.StopAtBounds
            width: 600
            height: childrenRect.height
            model: champModel.spells
            delegate: Ability { }
            spacing: 8
        }
    }
}
