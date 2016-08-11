//
//  RQTabelViewController.m
//  RQClasses
//
//  Created by Raija on 16/8/11.
//  Copyright © 2016年 __RQ__. All rights reserved.
//

#import "RQTabelViewController.h"
#import "RQDataSource.h"
#import "RQTableViewCell.h"
#import "RQNetWorkManager.h"

#define URL @"https://api.douban.com/v2/movie/top250?start=0&count=10"

@interface RQTabelViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RQDataSource *dataSource;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation RQTabelViewController

static NSString *const CELLIDENTIFIER = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataSource = [RQDataSource dataSourceWith:_dataArray identifier:CELLIDENTIFIER cellConfigBlock:^(id  _Nullable cell, id  _Nullable item) {
        //
        [cell configCellWithItem:item];
    }];
    
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerNib:nil forCellReuseIdentifier:CELLIDENTIFIER];
    
    typeof(self) weakSelf = self;
    [RQNetWorkManager dataTaskWith:URL completionHandler:^(NSArray *itemsArray) {
        //
        [weakSelf.dataSource rq_updateWithArray:itemsArray];
        [weakSelf.tableView reloadData];
    }];
    
}

@end
