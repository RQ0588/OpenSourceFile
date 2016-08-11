//
//  NSObject+RQProperty.m
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import "NSObject+RQProperty.h"

@implementation NSObject (RQProperty)

+ (void)createPropertyCodeWithDictionary:(NSDictionary *)dict {
    
    __block NSMutableString *mStr = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
       
        //属性
        NSString *code;
        NSLog(@"%@ %@",propertyName,[value class]);
        
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSTaggedPointerString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFConstantString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName];
        }
        
        [mStr appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",mStr);
    
}

@end
