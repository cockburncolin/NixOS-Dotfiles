import QtQuick
import Quickshell
import ".."

Item {
    id: clockWidget

    implicitWidth: clockText.implicitWidth + 20
    implicitHeight: parent.height

    property string timeFormat: "hh:mm"
    property string dateFormat: "yyyy-MM-dd"
    property string clockDisplayFormat: "hh:mm - mm-dd"

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            id: clockText
            anchors.centerIn: parent
            text: Qt.formatDateTime(clock.date, Colors.clockDisplayFormat)
            color: Colors.foregroundColor
            font.pixelSize: 13
            // font.family: "monospace"
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            parent.opacity = 0.8;
        }

        onExited: {
            parent.opacity = 1.0;
        }
    }
}
