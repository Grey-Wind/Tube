import Felgo 3.0
import QtQuick 2.0
import "helper"
import "pages"

Item {
    anchors.fill: parent

    // app content with plugin list
    NavigationStack {
        id: pluginMainItem

        // initial page contains list if plugins and opens pages for each plugin when selected
        ListPage {
            id: page
            title: qsTr("Felgo Plugins")

            model: ListModel {
                ListElement { type: "Advertising"; name: "AdMob";
                    detailText: "Ad Monetization and Promotion"; image: "../assets/logo-admob.png" }
                ListElement { type: "In-App Purchases"; name: "Soomla"
                    detailText: "In-App Purchases & Virtual Currency"; image: "../assets/logo-soomla.png" }
                ListElement { type: "Social"; name: "Facebook"
                    detailText: "Social Sharing & Friend Invites"; image: "../assets/logo-facebook.png" }
                ListElement { type: "Social"; name: "Felgo Game Network"
                    detailText: " Cloud Storage, User Auth, Chat & more"; image: "../assets/logo-vpgn.png" }
                ListElement { type: "Notifications"; name: "Local Notifications"
                    detailText: "Schedule Local Notifications"; image: "../assets/logo-localpush.png" }
                ListElement { type: "Augmented Reality"; name: "Wikitude"
                    detailText: "Augmented Reality SDK"; image: "../assets/logo-wikitude.png" }
            }

            delegate: PluginListItem {
                visible: name !== "GameCenter" || Theme.isIos
                opacity: enabled ? 1.0 : 0.3

                onSelected: {
                    switch (name) {
                    case "AdMob":
                        page.navigationStack.push(Qt.resolvedUrl("pages/AdMobPage.qml"))
                        break
                    case "Soomla":
                        page.navigationStack.push(soomlaPage)
                        break
                    case "Facebook":
                        page.navigationStack.push(facebookPage)
                        break
                    case "Local Notifications":
                        page.navigationStack.push(notificationPage)
                        break
                    case "Wikitude":
                        page.navigationStack.push(Qt.resolvedUrl("pages/WikitudePage.qml"))
                        break
                    case "Felgo Game Network":
                        page.navigationStack.push(Qt.resolvedUrl("pages/FelgoGameNetworkGamePage.qml"))
                        break
                    }
                }
            }

            section.property: "type"
            section.delegate: SimpleSection { }
        }
    }
}
