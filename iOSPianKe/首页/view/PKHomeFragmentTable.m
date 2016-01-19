//
//  PKHomeFragmentTable.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/19.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKHomeFragmentTable.h"
#import "MJRefresh.h"
#import "MJDIYHeader.h"
#import "MJDIYAutoFooter.h"
#import "MJDIYBackFooter.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter.h"
@interface PKHomeFragmentTable()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKHomeFragmentTable

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self addRefreshControl];
    }
    return self;
}
#pragma mark - add Refresh Control method

- (void)addRefreshControl {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    [self.mj_header beginRefreshing];
    
    MJChiBaoZiFooter *footer = [MJChiBaoZiFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    footer.refreshingTitleHidden = YES;
    self.mj_footer = footer;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    
    return cell;
}


@end








