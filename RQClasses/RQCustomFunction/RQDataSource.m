//
//  RQDataSource.m
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import "RQDataSource.h"

typedef void(^CellConfigBlock)(id _Nullable cell, id _Nullable item);

@interface RQDataSource()

@property (nonatomic, strong, readwrite) NSMutableArray *_Nullable valuesArray;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) CellConfigBlock cellConfigBlock;

@end

@implementation RQDataSource

+ (nonnull instancetype)dataSourceWith:(nullable NSArray *)values
                            identifier:(nullable NSString *)identifier
                       cellConfigBlock:(nullable void(^)(id _Nullable cell, id _Nullable item))block {
    
    return [[self alloc] initWithDataSource:values identifier:identifier cellConfigBlock:block];
}

- (nonnull instancetype)initWithDataSource:(nullable NSArray *)values
                                identifier:(nullable NSString *)identifier
                           cellConfigBlock:(nullable void(^)(id _Nullable cell, id _Nullable item))block {
    
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.valuesArray = [NSMutableArray arrayWithArray:values];
        self.cellConfigBlock = [block copy];
    }
    
    return self;
}

#pragma mark -- 提供方法更新、删除、获取

- (void)rq_insertValueWithItem:(NSInteger)item value:(id _Nullable)value {
    
    if ([self canEditArray:item]) {
        [self.valuesArray insertObject:value atIndex:item];
    }
    
}

- (void)rq_deleteValueWithItem:(NSInteger)item {
    
    if ([self canEditArray:item]) {
        [self.valuesArray removeObjectAtIndex:item];
    }
    
}

- (id _Nullable)rq_valueWithItem:(NSInteger)item {
    
    if ([self canEditArray:item]) {
        return self.valuesArray[item];
    }
    
    return nil;
}

- (BOOL)canEditArray:(NSInteger)item {
    
    if (item < self.valuesArray.count && item >= 0) {
        return YES;
    }
    
    return NO;
}

- (void)rq_updateWithArray:(nullable NSArray *)array {
    
    self.valuesArray = nil;
    self.valuesArray = [NSMutableArray arrayWithArray:array];
    
}

- (id _Nullable)itemWithIndexPath:(NSIndexPath *)indexPath {
    
    return self.valuesArray[indexPath.row];
    
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.valuesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id item = [self itemWithIndexPath:indexPath];
    self.cellConfigBlock(cell, item);
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.valuesArray removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

@end
