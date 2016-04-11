import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: champion

    ListModel {
        id: listModel
    }

    property var champModel
    width: 600; height: 600

    Rectangle {
        anchors.fill: parent
        anchors.margins: 20

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
            width: 200; height: 200
            model: champModel.spells
            delegate: Image {
                source: Riot.dataDragonSpell + modelData.image.full
            }


        }
    }


}
