import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    lazy var engine = FlutterEngine(name: "root.engine")
  
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        engine.run()
        GeneratedPluginRegistrant.register(with: engine)
        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = {
            let nav = UINavigationController(rootViewController: FirstViewController())
            nav.setNavigationBarHidden(true, animated: false)
            PlayingNavigator.shared.navigationController = nav
            PlayingNavigator.shared.engine = self.engine
            return nav
        }()
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
