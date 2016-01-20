//
//  PKHomeFragmentTable.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/19.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKFragmentTable.h"
#import "MJRefresh.h"
#import "MJDIYHeader.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "PKFragmentTableCell.h"
@interface PKFragmentTable()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKFragmentTable

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //添加mj刷新
        [self addRefreshControl];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    self.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据高度数组中元素的个数来确定tableview显示cell的数量
    return _cellHeightArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [[_cellHeightArray[indexPath.row] valueForKey:@"cellHeight"] floatValue];
    NSLog(@"heitht %lf",height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    PKFragmentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[PKFragmentTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    //传给cell的高度字典
    cell.heightDic = _cellHeightArray[indexPath.row];
    //传给cell的内容模型
    cell.counterList = _FragmentModel[indexPath.row];
    return cell;
}
//下拉刷新全部数据
- (void)loadMoreData{
    if (_MoreDataBlock) {
        _MoreDataBlock();
    }
}
//上拉加载更多数据
- (void)loadNewData{
    if (_NewDataBlock) {
        _NewDataBlock();
    }
}
@end








