import Felgo 3.0
import QtQuick 2.0
import "pages"
import "helper"

/*/////////////////////////////////////
  NOTE:
  Additional integration steps are needed to use Felgo Plugins, for example to add and link required libraries for Android and iOS.
  Please follow the integration steps described in the plugin documentation of your chosen plugins:
  - AdMob: https://felgo.com/doc/plugin-admob/
  - Soomla: https://felgo.com/doc/plugin-soomla/
  - Facebook: https://felgo.com/doc/plugin-facebook/
  - Local Notifications: https://felgo.com/doc/plugin-notification/
  - Wikitude: https://felgo.com/doc/plugin-wikitude/
  - GameNetwork: https://felgo.com/game-network

  To open the documentation of a plugin item in Qt Creator, place your cursor on the item in your QML code and press F1.
  This allows to view the properties, methods and signals of Felgo Plugins directly in Qt Creator.

/////////////////////////////////////*/

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    // This item contains example code for the chosen Felgo Plugins
    // It is hidden by default and will overlay the QML items below if shown
    PluginMainItem {
        id: pluginMainItem
        z: 1           // display the plugin example above other items in the QML code below
        visible: false // set this to true to show the plugin example

        // keep only one instance of these plugin-pages alive within app
        // this prevents crashes due to destruction of plugin items when popping pages from the stack
        property alias soomlaPage: soomlaPage
        property alias facebookPage: facebookPage
        property alias notificationPage: notificationPage

        SoomlaPage {
            id: soomlaPage
            visible: false
            onPushed: soomlaPage.listView.contentY = soomlaPage.listView.originY
            onPopped: { soomlaPage.parent = pluginMainItem; visible = false }
        }

        FacebookPage {
            id: facebookPage
            visible: false
            onPopped: { facebookPage.parent = pluginMainItem; visible = false }
        }

        LocalNotificationPage {
            id: notificationPage
            visible: false
            onPopped: { notificationPage.parent = pluginMainItem; visible = false }
        }
    }

    MenuScene {
        id:menuScene
        // we define all scenes as invisible by default
        opacity:0
        // if the start button in the MenuScene is pressed we set the state to game
        // this will hide the menuScene and make the gameScene visible
        onStartPressed: gameWindow.state = "game"
    }

    GameScene {id:gameScene; opacity: 0}

    // default state is "menu"
    state: "menu"

    //state machine, used to set only one scene visible at a time
    states: [
        State {
            name: "menu"
            // by switching the opacity property to 1, which is by default set to 0 above,
            // the Behavior defined in SceneBase takes care of animating the opacity of the new Scene from 0 to 1,
            // and any other Scene back to its default value (in our case from 1 to 0)
            PropertyChanges { target: menuScene; opacity: 1}
        },
        State {
            name: "game"
            PropertyChanges { target: gameScene; opacity: 1}
        }
    ]
}

