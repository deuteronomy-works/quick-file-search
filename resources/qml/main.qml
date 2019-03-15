import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.5
import QtGraphicalEffects 1.0
import "Components"

ApplicationWindow {
    visible: true
    width: 800
    height: 580

    ColumnLayout {
        width: parent.width
        height: parent.height
        spacing: 0

        Rectangle {
            id: input_pane
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            color: "darkgrey"

            RowLayout {
                width: parent.width
                height: parent.height

                Rectangle {
                    id: icon_cont
                    Layout.preferredWidth: 700
                    Layout.preferredHeight: 36
                    color: "transparent"

                    RowLayout {
                        id: search_cont
                        anchors.fill: parent
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            Layout.preferredWidth: 400
                            Layout.minimumWidth: 280
                            Layout.fillHeight: true
                            color: "Transparent"

                            Rectangle {
                                anchors.centerIn: parent
                                width: 320
                                height: 32

                                Rectangle {
                                    id: search_layout
                                    width: parent.width
                                    height: parent.height
                                    radius: 4

                                    RowLayout {
                                        width: parent.width
                                        height: parent.height
                                        anchors.fill: parent
                                        clip: parent

                                        Rectangle {
                                            Layout.preferredWidth: 32
                                            Layout.fillHeight: true
                                            clip: parent

                                            Label {
                                                anchors.centerIn: parent
                                                id: search_icon
                                                text: "\uE721"
                                                font.family: "Segoe MDL2 Assets"
                                                font.pixelSize: 18
                                            }

                                        }

                                        Rectangle {
                                            id: sFFocus
                                            width: parent.width - 76
                                            height: parent.height

                                            property int len: 0
                                            property int prevWidth: 0
                                            property int thisCharWidth: 0
                                            property int prevCharWidth: 0

                                            Text {
                                                x: 0
                                                anchors.verticalCenter: parent.verticalCenter
                                                id: search_text
                                                font.pixelSize: 16
                                                color: "black"
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                hoverEnabled: true
                                                cursorShape: Qt.IBeamCursor

                                                onEntered: {
                                                    sFFocus.focus = true
                                                }

                                                onExited: {
                                                    sFFocus.focus = false
                                                }

                                            }

                                            // Key Interactions

                                            focus: false
                                            Keys.onPressed: {


                                                /*
                                                  This prevents the textfield from overflowing by stoping its propagation
                                                */
                                                if(event.key === Qt.Key_Backspace) {
                                                    len = search_text.text.length - 1
                                                    search_text.text = search_text.text.slice(0, len)

                                                } else if(search_text.contentWidth >= 624){
                                                    // do nothing
                                                } else {
                                                    search_text.text += event.text
                                                }


                                                /****************************************
                                                 *                                      *
                                                 * Delete and Text Overflow Capability  *
                                                 *                                      *
                                                 ****************************************/

                                                /*thisCharWidth = search_text.contentWidth - prevWidth
                                                prevWidth = search_text.contentWidth
                                                /*if(search_text.contentWidth < 460) {
                                                    /*if(event.key === Qt.Key_Backspace) {
                                                        len = search_text.text.length - 1
                                                        search_text.text = search_text.text.slice(0, len)
                                                    } else {
                                                        search_text.text += event.text
                                                    }*/
                                                /*}*/
                                                /*else {
                                                    /*if(event.key === Qt.Key_Backspace) {
                                                        len = search_text.text.length - 1
                                                        search_text.text = search_text.text.slice(0, len)
                                                        search_text.x += thisCharWidth
                                                    } else {
                                                        search_text.text += event.text
                                                        search_text.x -= thisCharWidth
                                                    }*/
                                                /*}*/
                                            }
                                        }

                                        Rectangle {

                                            width: 32
                                            height: parent.height
                                            color: "dodgerblue"
                                            clip: parent

                                            Image {
                                                anchors.centerIn: parent
                                                id: clickBtn
                                                source: "../images/ic_arrow_forward_white.png"
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                cursorShape: Qt.PointingHandCursor
                                            }

                                        }

                                    }

                                }

                                DropShadow {
                                    anchors.fill: search_layout
                                    horizontalOffset: 0
                                    verticalOffset: 0
                                    radius: 8
                                    samples: 17
                                    color: "#3a3a0000"
                                    source: search_layout
                                }

                            }


                        }

                    }


                }

                Rectangle {
                    id: other_cont
                    Layout.preferredWidth: 64
                    Layout.preferredHeight: 36
                }

            }

        }

        Rectangle {
            id: view_pane
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    id: curr_path
                    Layout.fillWidth: true
                    Layout.preferredHeight: 48

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 4

                        Rectangle {
                            id: hist_ctrls
                            Layout.preferredWidth: 120
                            Layout.fillHeight: true
                            //color: "dodgerblue"

                            RowLayout {
                                width: parent.width
                                anchors.centerIn: parent
                                spacing: 0

                                Button {
                                    Layout.fillWidth: true
                                    font.family: "Segoe MDL2 Assets"
                                    text: "\uE96F"
                                }

                                Button {
                                    Layout.fillWidth: true
                                    font.family: "Segoe MDL2 Assets"
                                    text: "\uE970"
                                }

                            }

                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            TextField {
                                width: parent.width
                            }

                        }

                        Rectangle {
                            Layout.preferredWidth: 48
                            Layout.fillHeight: true
                            border.width: 1

                            Button {
                                width: parent.width
                                text: "Go"
                            }

                        }

                    }

                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: 'dodgerblue'

                    GridView {
                        id: grid
                        anchors.fill: parent
                        anchors.margins: 8
                        cellWidth: 240
                        cellHeight: 240
                        model: GridModel {}
                        delegate: GridDelegate {}
                    }

                }


            }

        }


    }

    footer: Rectangle {
        width: parent.width
        height: 36
        color: "darkgrey"
    }

}
