import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
    id: inputDialog
    title: "Enter API key"
    visible: true
    height: 100
    width: 500
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    onAccepted: {
        Riot.saveApiKey(textField.text)
        Riot.hasApiKey();
    }

    TextField {
        id: textField
        width: inputDialog.width * 0.90
        onAccepted: {
            console.log("Hello 2")
        }
    }
}
