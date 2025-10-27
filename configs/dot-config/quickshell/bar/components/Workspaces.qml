import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import ".."

Item {
    id: workspacesWidget

    implicitWidth: workspacesRow.implicitWidth
    implicitHeight: parent.height

    RowLayout {
        id: workspacesRow
        anchors.fill: parent
        spacing: 2

        Repeater {
            model: 10

            Rectangle {
                id: workspaceButton

                Layout.preferredWidth: 30
                Layout.preferredHeight: 22
                Layout.alignment: Qt.AlignVCenter

                radius: 6

                // Determine workspace state
                property int workspaceId: index + 1
                property bool isActive: {
                    if (!Hyprland.focusedMonitor || !Hyprland.focusedMonitor.activeWorkspace)
                        return false;
                    return Hyprland.focusedMonitor.activeWorkspace.id === workspaceId;
                }
                property bool isOccupied: {
                    if (!Hyprland.workspaces || !Hyprland.workspaces.values)
                        return false;
                    for (let i = 0; i < Hyprland.workspaces.values.length; i++) {
                        let ws = Hyprland.workspaces.values[i];
                        if (ws && ws.id === workspaceId && ws.windows && ws.windows.values && ws.windows.values.length > 0) {
                            return true;
                        }
                    }
                    return false;
                }
                property bool workspaceExists: {
                    if (!Hyprland.workspaces || !Hyprland.workspaces.values)
                        return false;
                    for (let i = 0; i < Hyprland.workspaces.values.length; i++) {
                        if (Hyprland.workspaces.values[i] && Hyprland.workspaces.values[i].id === workspaceId) {
                            return true;
                        }
                    }
                    return false;
                }

                // Only show workspace based on config setting
                visible: Colors.showEmptyWorkspaces || workspaceExists || isActive

                // Color based on state
                color: {
                    if (isActive)
                        return Colors.workspaceActiveColor;
                    else if (isOccupied || workspaceExists)
                        return Colors.workspaceOccupiedColor;
                    else
                        return Colors.workspaceEmptyColor;
                }

                border.color: isActive ? Colors.workspaceActiveBorderColor : "transparent"
                border.width: isActive ? 1 : 0

                // Smooth transitions
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                    }
                }

                Behavior on border.color {
                    ColorAnimation {
                        duration: 150
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: workspaceButton.workspaceId
                    color: workspaceButton.isActive ? Colors.workspaceActiveTextColor : Colors.workspaceInactiveTextColor
                    font.pixelSize: 12
                    font.bold: workspaceButton.isActive
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Hyprland.dispatch("workspace " + workspaceButton.workspaceId);
                    }

                    onEntered: {
                        if (!workspaceButton.isActive) {
                            workspaceButton.opacity = 0.7;
                        }
                    }

                    onExited: {
                        workspaceButton.opacity = 1.0;
                    }
                }
            }
        }
    }
}
