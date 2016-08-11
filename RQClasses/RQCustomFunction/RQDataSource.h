//
//  RQDataSource.h
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RQDataSource : NSObject <UITableViewDataSource>
//传入之后不允许用户在外面随意更改数据
@property (nonatomic, strong, readonly) NSMutableArray *_Nullable valuesArray;

+ (nonnull instancetype)dataSourceWith:(nullable NSArray *)values
                            identifier:(nullable NSString *)identifier
                       cellConfigBlock:(nullable void(^)(id _Nullable cell, id _Nullable item))block;

- (nonnull instancetype)initWithDataSource:(nullable NSArray *)values
                                identifier:(nullable NSString *)identifier
                           cellConfigBlock:(nullable void(^)(id _Nullable cell, id _Nullable item))block;

//提供方法更新、删除、获取
- (void)rq_insertValueWithItem:(NSInteger)item value:(id _Nullable)value;

- (void)rq_deleteValueWithItem:(NSInteger)item;

- (id _Nullable)rq_valueWithItem:(NSInteger)item;

- (void)rq_updateWithArray:(nullable NSArray *)array;

@end
