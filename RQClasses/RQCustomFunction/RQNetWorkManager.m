//
//  RQNetWorkManager.m
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import "RQNetWorkManager.h"
#import "AFNetworking.h"
#import "RQTableViewModel.m"
#import "NSObject+RQProperty.h"

@implementation RQNetWorkManager

+ (void)dataTaskWith:(NSString *)url completionHandler:(void(^)(NSArray * itemsArray))block {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        //
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
       //
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSMutableArray *array = [NSMutableArray array];
        NSArray *objects = dict[@"subjects"];
        for (NSDictionary *dic in objects) {
            [array addObject:[RQTableViewModel tabelViewModelWith:dic]];
        }
        if (block) {
            block(array);
        }
        
    }];
    
    [dataTask resume];
    
}

@end
