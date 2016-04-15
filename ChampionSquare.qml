import QtQuick 2.6

Rectangle {
    id: champSquare
    border.color: "grey"
    border.width: 1

    Image {
        id: champSquareImage
        anchors.centerIn: champSquare
        width: champSquare.width - champName.height - 10; height: width
        anchors.horizontalCenter: champSquare.horizontalCenter
        clip: true
        source: Riot.dataDragonPortrait + modelData.image.full
    }

    Text {
        id: champName
        text: modelData.name
        width: champSquare.width;
        bottomPadding: 8
        horizontalAlignment: Text.AlignHCenter
        anchors.top: champSquareImage.bottom
        color: "black"
    }

    MouseArea {
        id: click
        anchors.fill: parent
        onClicked: {
            console.log(modelData.id + " " + modelData.name);
            var component = Qt.createComponent("ChampionWindow.qml");
            if (component.status === Component.Ready) {
                var window = component.createObject(root, {"champModel": modelData});
                window.show();
            }
        }
    }
}
