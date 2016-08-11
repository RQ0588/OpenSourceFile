//
//  NSObject+RQProperty.h
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RQProperty)

//根据字典自动生成属性
+ (void)createPropertyCodeWithDictionary:(NSDictionary *)dict;

@end
