import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: champion

    property var champModel
    width: 600; height: 600

    Rectangle {
        id: mainInfo
        anchors.fill: parent
        anchors.margins: 10

        Image {
            id: portrait
            width: 100; height: 100
            source: Riot.dataDragonPortrait + champModel.image.full
        }

        Text {
            id: name
            anchors.left: portrait.right
            anchors.leftMargin: 10
            text: champModel.name
            font.pixelSize: 20
        }

        Text {
            id: title
            anchors.left: name.left
            anchors.top: name.bottom
            text: champModel.title
            font.pixelSize: 12
        }

        ListView {
            anchors.top: portrait.bottom
            anchors.topMargin: 20
            width: mainInfo.width;
            height: mainInfo.height - portrait.height
            model: champModel.spells
            delegate: Ability { }
            spacing: 10
        }
    }
}
