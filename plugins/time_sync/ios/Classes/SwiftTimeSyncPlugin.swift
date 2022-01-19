import Flutter
import UIKit

public class SwiftTimeSyncPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "time_sync", binaryMessenger: registrar.messenger())
    let instance = SwiftTimeSyncPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
      } else if call.method == "getBootTimeInterval" {
          result(Int64(bootTimeInterval() * 1000.0));
      }
  }
}

/// 获取设备已启动时间（秒），设备重启会重置为0
func bootTimeInterval() -> TimeInterval {
    var boottime: timeval = timeval()
    var mib = [CTL_KERN, KERN_BOOTTIME]
    var size = MemoryLayout<timeval>.size
    sysctl(&mib, 2, &boottime, &size, nil, 0)
    //受系统时间影响
    return Date().timeIntervalSince1970 - (CGFloat(boottime.tv_sec) + Double(boottime.tv_usec)/1000000.0)
}
