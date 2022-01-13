import Flutter
import UIKit

public class SwiftIntroSegmentPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "intro_segment", binaryMessenger: registrar.messenger())
        let instance = SwiftIntroSegmentPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        let factory = NanoSegmentViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: SegmentViewName)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPlatformVersion" {
            result("iOS " + UIDevice.current.systemVersion)
        }
    }
}
