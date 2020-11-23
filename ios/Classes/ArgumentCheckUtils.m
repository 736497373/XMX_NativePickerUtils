//
//  ArgumentCheckUtils.m
//  native_picker_utils
//
//  Created by xiemaoxiong on 2020/11/23.
//

#import "ArgumentCheckUtils.h"
#import <BRPickerView/BRResultModel.h>
#import <YYModel/YYModel.h>
@implementation ArgumentCheckUtils

+(void)ArgumentCheckWithArguments:(NSDictionary *)arguments
                           result:(void(^)(NSString *title,NSArray* dataSourceArr, NSArray *selectIndex))result {
    NSString *title = [arguments valueForKey:@"title"];
    NSString *dataSourceArrJsonString = [arguments valueForKey:@"dataSourceArr"];
    NSString *selectIndexJsonString = [arguments valueForKey:@"selectIndex"];
    
    NSArray *arr;
    
    NSArray *dataSourceArr;
    NSArray *selectIndexArr;
    
    arr = [ArgumentCheckUtils ArrayCheckWithJson:dataSourceArrJsonString];
    selectIndexArr = [ArgumentCheckUtils ArrayCheckWithJson:selectIndexJsonString];
    
    if ([arr.firstObject isKindOfClass:[NSString class]]) {
        dataSourceArr = arr;
    }else if ([arr.firstObject isKindOfClass:[NSDictionary class]]) {
        dataSourceArr = [NSArray yy_modelArrayWithClass:[BRResultModel class] json:arr];
    }else if ([arr.firstObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mArray = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableArray *subArray = [NSMutableArray array];
            if ([obj.firstObject isKindOfClass:[NSString class]]) {
                NSLog(@"arr1 = %@",obj);
                subArray = [obj mutableCopy];
                [mArray addObject:subArray];
            }else if ([obj.firstObject isKindOfClass:[NSDictionary class]]) {
                NSLog(@"arr2 = %@",obj);
                subArray = [[NSArray yy_modelArrayWithClass:[BRResultModel class] json:obj] mutableCopy];
                [mArray addObject:subArray];
            }
        }];
        
        dataSourceArr = [mArray mutableCopy];
    }
    
    if (result) {
        result(title,dataSourceArr,selectIndexArr);
    }
    
}



+(NSArray *)ArrayCheckWithJson:(NSString *)json {
    NSArray *arr = @[];
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    }
    
    if (!jsonData) {
        return arr;
    }
    arr = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
    if (![arr isKindOfClass:[NSArray class]]){
        return arr;
    };
    
    return  arr;
}
@end
