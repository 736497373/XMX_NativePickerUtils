//
//  BRStringPickerViewUtils.m
//  native_picker_utils
//
//  Created by xiemaoxiong on 2020/11/23.
//

#import "BRStringPickerViewUtils.h"
#import <BRPickerView/BRPickerView.h>
#import <YYModel/YYModel.h>
@implementation BRStringPickerViewUtils
+ (void)showPickerWithTitle:(NSString *)title
              dataSourceArr:(NSArray *)dataSourceArr
                selectIndex:(NSArray *)selectIndex
              flutterResult:(FlutterResult)flutterResult {
    NSLog(@"showPickerWithTitle with title = %@ dataSourceArr = %@ selectIndex = %@",title,dataSourceArr,selectIndex);
    [BRStringPickerView showPickerWithTitle:title dataSourceArr:dataSourceArr selectIndex:[selectIndex.firstObject integerValue] resultBlock:^(BRResultModel * _Nullable resultModel) {
        if (flutterResult) {
            flutterResult([resultModel yy_modelToJSONString]);
        }
    }];
}


+ (void)showMultiPickerWithTitle:(NSString *)title
              dataSourceArr:(NSArray *)dataSourceArr
                selectIndex:(NSArray *)selectIndex
                   flutterResult:(FlutterResult)flutterResult {
    NSLog(@"showMultiPicker with title = %@ dataSourceArr = %@ selectIndex = %@",title,dataSourceArr,selectIndex);
    [BRStringPickerView showMultiPickerWithTitle:title dataSourceArr:dataSourceArr selectIndexs:selectIndex resultBlock:^(NSArray<BRResultModel *> * _Nullable resultModelArr) {
        if (flutterResult) {
            flutterResult([resultModelArr yy_modelToJSONString]);
        }
    }];
}
@end
