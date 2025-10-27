pragma Singleton
import QtQml

QtObject {
    // Bar appearance
    property int barHeight: 30
    property int spacing: 10
    property int borderRadius: 0

    // Module toggles
    property bool showWorkspaces: true
    property bool showSystemTray: true
    property bool showClock: true
    property bool showVolume: false
    property bool showBattery: false
    property bool showNetwork: false

    // Workspace settings
    property int workspaceCount: 10
    property bool showEmptyWorkspaces: false
    property int workspaceButtonWidth: 30
    property int workspaceButtonHeight: 24

    // Clock settings
    property string timeFormat: "hh:mm"
    property string dateFormat: "yyyy-MM-dd"
    property string clockDisplayFormat: "hh:mm - yyyy-MM-dd"
}
