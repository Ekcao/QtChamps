import QtQuick 2.6
import QtGraphicalEffects 1.0

Rectangle {
    id: ability

    anchors.margins: 10
    border.color: "grey"
    border.width: 1

    width: parent.width; height: 100

    Image {
        id: abilitySquare
        width: 48; height: 48
        source: Riot.dataDragonSpell + modelData.image.full
    }
}
