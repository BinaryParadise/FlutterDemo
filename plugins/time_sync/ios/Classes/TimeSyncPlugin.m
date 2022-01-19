#import "TimeSyncPlugin.h"
#if __has_include(<time_sync/time_sync-Swift.h>)
#import <time_sync/time_sync-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "time_sync-Swift.h"
#endif

@implementation TimeSyncPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTimeSyncPlugin registerWithRegistrar:registrar];
}
@end
