//
//  RQNetWorkManager.h
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RQNetWorkManager : NSObject

+ (void)dataTaskWith:(NSString *)url completionHandler:(void(^)(NSArray * itemsArray))block;

@end
