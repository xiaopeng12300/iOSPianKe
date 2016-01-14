//
//  JPRefreshView.h
//  PianKe
//
//  Created by 赵金鹏 on 15/12/3.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPRefreshView : UIView

//调用这个方法显示到一个视图上
+ (void)showJPRefreshFromView:(UIView *)superView;

//调用这个方法从一个视图上移除
+ (void)removeJPRefreshFromView:(UIView *)superView;

//显示到一个视图上，在y轴上偏移
+ (void)showJPRefreshFromView:(UIView *)superView offSetY:(CGFloat)offSetY;

@end
