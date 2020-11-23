#import "NativePickerUtilsPlugin.h"
#import "ArgumentCheckUtils.h"
#import "BRStringPickerViewUtils.h"
@implementation NativePickerUtilsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"native_picker_utils"
            binaryMessenger:[registrar messenger]];
  NativePickerUtilsPlugin* instance = [[NativePickerUtilsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"showPicker" isEqualToString:call.method]) {
      [ArgumentCheckUtils ArgumentCheckWithArguments:call.arguments result:^(NSString * _Nonnull title, NSArray * _Nonnull dataSourceArr,  NSArray * _Nonnull selectIndex) {
          [BRStringPickerViewUtils showPickerWithTitle:title dataSourceArr:dataSourceArr selectIndex:selectIndex flutterResult:result];
      }];
  }else if ([@"showMultiPicker" isEqualToString:call.method]){
      [ArgumentCheckUtils ArgumentCheckWithArguments:call.arguments result:^(NSString * _Nonnull title, NSArray * _Nonnull dataSourceArr,  NSArray * _Nonnull selectIndex) {
          [BRStringPickerViewUtils showMultiPickerWithTitle:title dataSourceArr:dataSourceArr selectIndex:selectIndex flutterResult:result];
      }];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
