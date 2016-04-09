import QtQuick 2.0

Item {
    id: champRoot

    Image {
        id: portrait
        anchors.centerIn: champRoot
        width: champRoot.width - name.height - 10; height: width
        anchors.horizontalCenter: champRoot.horizontalCenter
        fillMode: Image.PreserveAspectFit
        clip: true
        source: Riot.dataDragonURL + modelData.image.full
    }

    Text {
        id: name
        text: modelData.name
        width: champRoot.width;
        horizontalAlignment: Text.AlignHCenter
        anchors.top: portrait.bottom
        color: "black"
    }

    MouseArea {
        id: click
        anchors.fill: parent
        onClicked: console.log(modelData.name)
    }
}
