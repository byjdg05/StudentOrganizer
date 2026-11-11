import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Touch the Core Data stack once at launch so the database loads (and prints its path) early.
        _ = CoreDataStack.shared
        return true
    }

    // Tells UIKit which scene configuration (from Info.plist) to use for a new window.
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }

    // Save any pending Core Data changes when the app is about to close.
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.shared.save()
    }
}
