import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.5

Component {
    Rectangle {
        width: grid.cellWidth
        height: grid.cellHeight
        //border.width: 1
        //border.color: "darkgrey"
        color: "transparent"


        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 36
                color: "darkgrey"

                Label {
                    anchors.centerIn: parent
                    text: name
                    font.family: "Segoe UI Semilight"
                }

            }



        }

    }
}
