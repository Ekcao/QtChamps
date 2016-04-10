import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
    id: inputDialog
    title: "Enter API key"
    visible: true
    height: 80
    width: 250
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    onAccepted: {
        Riot.saveApiKey(textField.text)
        Riot.getChampions();
    }

    TextField {
        id: textField
        width: inputDialog.width * 0.90
    }
}
