//
//  MJChiBaoZiHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/12.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJChiBaoZiHeader.h"
@implementation MJChiBaoZiHeader
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=1; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pullRefresh"]];
        [idleImages addObject:image];
    }
     [self setImages:idleImages forState:MJRefreshStateIdle];
    
    //松开进入刷新状态的图片
    NSMutableArray *refreshPullImages = [NSMutableArray array];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading"]];
    [refreshPullImages addObject:image];
    [self setImages:refreshPullImages forState:MJRefreshStatePulling];
    
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=28; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh%zd",i]];
        [refreshingImages addObject:image];
    }
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    
    //即将进入刷新状态
    NSMutableArray *refreshStateImages = [NSMutableArray array];
    UIImage *StateImage = [UIImage imageNamed:[NSString stringWithFormat:@"loading"]];
    [refreshStateImages addObject:StateImage];
    [self setImages:refreshStateImages forState:MJRefreshStateWillRefresh];
}
@end
