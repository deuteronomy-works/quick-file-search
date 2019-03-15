import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.5
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
                height: parent.height

                Rectangle {
                    id: icon_cont
                    Layout.preferredWidth: 36
                    Layout.preferredHeight: 36
                    border.width: 1
                    radius: 8

                }

                Rectangle {
                    id: search_box
                    //Layout.fillWidth: true
                    Layout.preferredWidth: 124
                    Layout.preferredHeight: 36
                }

                Rectangle {
                    id: search_btn_cont
                    Layout.preferredWidth: 48
                    Layout.preferredHeight: 36
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
                            color: "dodgerblue"
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "lime"
                        }

                        Rectangle {
                            Layout.preferredWidth: 48
                            Layout.fillHeight: true
                            border.width: 1
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
