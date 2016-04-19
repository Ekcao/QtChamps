import QtQuick 2.6
import QtGraphicalEffects 1.0

Rectangle {
    id: ability
    property variant abilityKeys: ["Q", "W", "E", "R"]

    border.color: "grey"
    border.width: 1

    width: parent.width; height: childrenRect.height + 16

    Image {
        id: abilitySquare
        width: 60; height: 60
        anchors.left: ability.left
        anchors.top: ability.top
        anchors.margins: 8
        fillMode: Image.PreserveAspectFit
        source: Riot.dataDragonSpell + modelData.image.full
    }

    Text {
        id: abilityName
        anchors.left: abilitySquare.right
        anchors.top: abilitySquare.top
        anchors.leftMargin: 8
        text: modelData.name
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: abilityCost
        anchors.left: abilityName.left
        anchors.top: abilityName.bottom
        text: "Cost: "
        font.pixelSize: 12
        font.bold: true
    }

    Text {
        id: abilityCostValue
        anchors.left: abilityCost.right
        anchors.top: abilityCost.top
        text: modelData.resource
        font.pixelSize: 12
    }

    Text {
        id: abilityRange
        anchors.left: abilityCooldown.left
        anchors.top: abilityCooldown.bottom
        text: "Range: "
        font.pixelSize: 12
        font.bold: true
    }

    Text {
        id: abilityRangeValue
        anchors.left: abilityRange.right
        anchors.top: abilityRange.top
        anchors.rightMargin: 8
        text: modelData.rangeBurn
        font.pixelSize: 12
    }

    Text {
        id: abilityKey
        anchors.right: ability.right
        anchors.top: ability.top
        anchors.margins: 8
        text: "[" + abilityKeys[index] + "]"
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        id: abilityCooldown
        anchors.left: abilityCost.left
        anchors.top: abilityCost.bottom
        text: "Cooldown: "
        font.pixelSize: 12
        font.bold: true
    }

    Text {
        id: abilityCooldownValue
        anchors.left: abilityCooldown.right
        anchors.top: abilityCost.bottom
        anchors.rightMargin: 8
        text: modelData.cooldownBurn + " sec"
        font.pixelSize: 12
    }

    Text {
        id: abilityDescription
        anchors.left: abilitySquare.left
        anchors.right: abilityKey.right
        anchors.top: abilitySquare.bottom
        anchors.topMargin: 8
        width: ability.width; height: contentHeight
        wrapMode: Text.WordWrap
        text: modelData.description
        font.pixelSize: 12
    }

    Text {
        id: abilityTooltip
        anchors.left: abilityDescription.left
        anchors.right: abilityDescription.right
        anchors.top: abilityDescription.bottom
        anchors.topMargin: 8
        width: ability.width; height: contentHeight
        wrapMode: Text.WordWrap
        text: modelData.tooltip
        font.pixelSize: 12
    }

    function getCostVal() {
        // Can also use effect vars
        return modelData.resource.replace("{{ cost }}", modelData.costBurn);
    }

    function getEffectVal() {
        // Effect/effect burn vars
    }

    function getCoeffVal() {
        // {{ aX }} and {{ fX }} vars
    }
}
