//
//  BRStringPickerViewUtils.h
//  native_picker_utils
//
//  Created by xiemaoxiong on 2020/11/23.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface BRStringPickerViewUtils : NSObject
+ (void)showPickerWithTitle:(NSString *)title
              dataSourceArr:(NSArray *)dataSourceArr
                selectIndex:(NSArray *)selectIndex
              flutterResult:(FlutterResult)flutterResult;

+ (void)showMultiPickerWithTitle:(NSString *)title
              dataSourceArr:(NSArray *)dataSourceArr
                selectIndex:(NSArray *)selectIndex
              flutterResult:(FlutterResult)flutterResult;

@end

NS_ASSUME_NONNULL_END
