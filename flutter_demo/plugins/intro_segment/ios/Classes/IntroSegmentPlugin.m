#import "IntroSegmentPlugin.h"
#if __has_include(<intro_segment/intro_segment-Swift.h>)
#import <intro_segment/intro_segment-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "intro_segment-Swift.h"
#endif

@implementation IntroSegmentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIntroSegmentPlugin registerWithRegistrar:registrar];
}
@end
