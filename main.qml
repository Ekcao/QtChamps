import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    visible: true
    width: 600; height: 600

    function showInputDialog() {
        var component = Qt.createComponent("InputDialog.qml");
        if (component.status == Component.Ready) {
            var dialog = component.createObject(root);
        }
    }

    GridView {
        anchors.fill: parent
        id: grid
        boundsBehavior: Flickable.StopAtBounds
        anchors.margins: 10
        cellWidth: (root.width - anchors.margins * 2) / 5
        cellHeight: (root.height - anchors.margins * 2) / 5
        model: Riot.champs
        delegate: Champion {
            width: grid.cellWidth; height: grid.cellHeight
        }
    }
}
