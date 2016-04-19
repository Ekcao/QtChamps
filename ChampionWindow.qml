import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: champion
    property var champModel
    width: champContent.width + 16; height: champContent.height + 16

    Rectangle {
        id: champContent
        anchors.centerIn: parent
        width: childrenRect.width; height: childrenRect.height

        Image {
            id: portrait
            width: 100; height: 100
            source: Riot.dataDragonPortrait + champModel.image.full
        }

        Text {
            id: champName
            anchors.left: portrait.right
            anchors.leftMargin: 8
            text: champModel.name
            font.pixelSize: 24
            font.bold: true
        }

        Text {
            id: champTitle
            anchors.left: champName.left
            anchors.top: champName.bottom
            text: champModel.title
            font.pixelSize: 14
        }

        Rectangle {
            id: passive
            anchors.top: portrait.bottom
            anchors.topMargin: 16
            border.color: "grey"
            border.width: 1
            width: list.width; height: childrenRect.height + 16

            Image {
                id: passiveSquare
                width: 60; height: 60
                anchors.left: passive.left
                anchors.top: passive.top
                anchors.margins: 8
                fillMode: Image.PreserveAspectFit
                source: Riot.dataDragonPassive + champModel.passive.image.full
            }

            Text {
                id: passiveName
                anchors.left: passiveSquare.right
                anchors.top: passiveSquare.top
                anchors.leftMargin: 8
                text: champModel.passive.name
                font.pixelSize: 16
                font.bold: true
            }

            Text {
                id: passiveDescription
                anchors.left: passiveSquare.left
                anchors.right: passiveKey.right
                anchors.top: passiveSquare.bottom
                anchors.topMargin: 8
                width: passive.width; height: contentHeight
                wrapMode: Text.WordWrap
                text: champModel.passive.description
                font.pixelSize: 12
            }

            Text {
                id: passiveKey
                anchors.right: passive.right
                anchors.top: passive.top
                anchors.margins: 8
                text: "[Passive]"
                font.pixelSize: 16
                font.bold: true
            }
        }

        ListView {
            id: list
            anchors.top: passive.bottom
            anchors.topMargin: 8
            boundsBehavior: Flickable.StopAtBounds
            width: 600
            height: 600
            clip: true
            model: champModel.spells
            delegate: Ability { }
            spacing: 8
        }
    }

    Component.onCompleted: {
        var champs = champion.champModel;
        var i;
        for (i in champs.spells) {
            champs.spells[i].resource = replaceCost(champs.spells[i]);
            champs.spells[i] = replaceInTooltip(champs.spells[i]);
        }

        champion.champModel = champs;
    }

    function replaceCost(spell) {
        if (spell.resource.indexOf('{{ cost }}') !== 1) {
            return spell.resource.replace('{{ cost }}', spell.costBurn);
        }
    }

    function replaceInTooltip(spell) {
        var newSpell = spell;
        var effectBurn = spell.effectBurn;
        var i;
        for (i = 1; i < effectBurn.length; i++) {
            var effectNum = "{{ e" + i + " }}";

            if (newSpell.resource.indexOf(effectNum) !== 1) {
                newSpell.resource = newSpell.resource.replace(effectNum, effectBurn[i]);
            }

            if (newSpell.tooltip.indexOf(effectNum) !== 1) {
                newSpell.tooltip = newSpell.tooltip.replace(effectNum, effectBurn[i]);
            }
        }

        return newSpell;
    }
}
