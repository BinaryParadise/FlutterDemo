import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      window = UIWindow(frame: UIScreen.main.bounds)
      window.makeKeyAndVisible()
      window.rootViewController = {
          let nav = UINavigationController(rootViewController: FirstViewController())
          nav.setNavigationBarHidden(true, animated: false)
          return nav
      }()
            
      // 配置路由跳转代理
      let delegate = PlayingBoostDelegate(nav: window.rootViewController as? UINavigationController)
      FlutterBoost.instance().setup(application, delegate: delegate) { engine in
      }
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
