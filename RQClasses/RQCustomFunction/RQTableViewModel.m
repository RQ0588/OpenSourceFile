//
//  RQTableViewModel.m
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import "RQTableViewModel.h"

@implementation RQTableViewModel

+ (instancetype)tabelViewModelWith:(NSDictionary *)dict {
    
    RQTableViewModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
