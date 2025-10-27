import QtQuick
import QtQuick.Layouts
import "components"

Rectangle {
    id: bar

    color: Colors.backgroundColor

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 10

        // Left Section - Workspaces
        Item {
            id: leftSection
            Layout.fillHeight: true
            Layout.preferredWidth: workspaces.implicitWidth

            Workspaces {
                id: workspaces
                anchors.fill: parent
            }
        }

        // Center Section
        Item {
            id: centerSection
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        // Right Section - System widgets
        Item {
            id: rightSection
            Layout.fillHeight: true
            Layout.preferredWidth: rightLayout.implicitWidth

            RowLayout {
                id: rightLayout
                anchors.fill: parent
                spacing: 10

                // Placeholder for SystemTray
                Item {
                    id: systemTrayPlaceholder
                    Layout.preferredWidth: 0
                    Layout.fillHeight: true
                    visible: false

                    // SystemTray will go here
                }

                // Clock widget
                Clock {
                    id: clock
                    Layout.fillHeight: true
                }
            }
        }
    }
}
