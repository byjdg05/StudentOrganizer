import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // The window is created automatically from Main.storyboard (see Info.plist),
    // so nothing needs to be set up here.
    var window: UIWindow?

    // Save when the app goes to the background so no data is lost if iOS closes it later.
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataStack.shared.save()
    }
}
