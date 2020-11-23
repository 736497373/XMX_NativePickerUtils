//
//  ArgumentCheckUtils.h
//  native_picker_utils
//
//  Created by xiemaoxiong on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArgumentCheckUtils : NSObject
+(void)ArgumentCheckWithArguments:(NSDictionary *)arguments
                           result:(void(^)(NSString *title,NSArray *dataSourceArr, NSArray *))result;
@end

NS_ASSUME_NONNULL_END
