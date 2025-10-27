import Quickshell
import Quickshell.Hyprland
import QtQuick
import "." as BarComponents

ShellRoot {
    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                id: panel

                anchors {
                    top: true
                    left: true
                    right: true
                }

                implicitHeight: 30

                BarComponents.Bar {
                    anchors.fill: parent
                }
            }
        }
    }
}
