import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    title: "League Champions"
    visible: true
    width: 600; height: 600

    function showInputDialog() {
        var component = Qt.createComponent("InputDialog.qml");
        if (component.status === Component.Ready) {
            var dialog = component.createObject(root);
        }
    }

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem {
                text: "Quit"
                onTriggered: Qt.quit()
            }
        }

        Menu {
            title: "About"
            MenuItem { text: "Patch " + Riot.version }
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
        delegate: ChampionSquare {
            width: grid.cellWidth; height: grid.cellHeight
        }
    }
}
