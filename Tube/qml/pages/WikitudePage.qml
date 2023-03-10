import Felgo 3.0
import QtQuick 2.0

Page {
    id: page
    title: "Wikitude Plugin"

    WikitudeArView {
        id: arView
        anchors.fill: parent
        running: true
        cameraPosition: WikitudeArView.BackCamera
        //arWorldSource: Qt.resolvedUrl(".html")   // See https://felgo.com/doc/plugin-wikitude/
        licenseKey: ""                             // Wikitude licenseKey - https://www.wikitude.com/
    }
}
