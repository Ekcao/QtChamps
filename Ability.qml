import QtQuick 2.6
import QtGraphicalEffects 1.0

Rectangle {
    id: ability
    property variant abilityKeys: ["Q", "W", "E", "R"]

    border.color: "grey"
    border.width: 1

    width: parent.width; height: 150

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
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: abilityCost
        anchors.left: abilityName.left
        anchors.top: abilityName.bottom
        text: "Cost: "
        font.pixelSize: 14
        font.bold: true
    }

    Text {
        id: abilityCostValue
        anchors.left: abilityCost.right
        anchors.top: abilityCost.top
        text: getCostVal()
        font.pixelSize: 14
    }

    Text {
        id: abilityRange
        anchors.left: abilityCost.left
        anchors.top: abilityCost.bottom
        text: "Range: "
        font.pixelSize: 14
        font.bold: true
    }

    Text {
        id: abilityRangeValue
        anchors.left: abilityRange.right
        anchors.top: abilityRange.top
        text: modelData.rangeBurn
        font.pixelSize: 14
    }

    Text {
        id: abilityKey
        anchors.right: ability.right
        anchors.top: ability.top
        anchors.margins: 8
        text: "[" + abilityKeys[index] + "]"
        font.pixelSize: 18
        font.bold: true
    }

    Text {
        id: abilityCooldown
        anchors.right: abilityCooldownValue.left
        anchors.top: abilityKey.bottom
        text: "Cooldown: "
        font.pixelSize: 14
        font.bold: true
    }

    Text {
        id: abilityCooldownValue
        anchors.right: ability.right
        anchors.top: abilityKey.bottom
        anchors.rightMargin: 8
        text: modelData.cooldownBurn + " sec"
        font.pixelSize: 14
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
