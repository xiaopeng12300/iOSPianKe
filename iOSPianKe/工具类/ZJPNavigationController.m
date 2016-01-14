//
//  ZJPNavigationController.m
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/18.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import "ZJPNavigationController.h"
#import "UIBarButtonItem+Helper.h"
#import "UIImage+Helper.h"

@interface ZJPNavigationController ()

@end

@implementation ZJPNavigationController

// nav的设置只需要设置一次即可， 保证只初始化一次
+ (void)initialize {
    // 获取UINavigationBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置navBar背景图片
//    [navBar setBackgroundImage:[UIImage resizedImage:@"navigationbar"] forBarMetrics:UIBarMetricsDefault];
    // 设置navBar的背景颜色
    [navBar setBarTintColor:[UIColor whiteColor]];
    
    // 设置导航栏标题颜色为白色
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor orangeColor],
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:16]
                                     }];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
    //    // 获取UIBarButtonItem
//    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
//
//    // 设置导航栏按钮文字常规效果
//    [barItem setTitleTextAttributes:@{
//                                      NSForegroundColorAttributeName : [UIColor blueColor],
//                                      NSFontAttributeName : [UIFont boldSystemFontOfSize:16]
//                                      } forState:UIControlStateNormal];
//    // 设置导航栏按钮文字的高亮效果
//    [barItem setTitleTextAttributes:@{
//                                      NSForegroundColorAttributeName : [[UIColor blueColor] colorWithAlphaComponent:.7f],
//                                      NSFontAttributeName : [UIFont boldSystemFontOfSize:16]
//                                      } forState:UIControlStateHighlighted];
//    
//    // 设置导航栏返回按钮的背景图片
//    [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [barItem setBackButtonBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}

// 重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断是否为根据控制器，如果不是跟控制器酒把tabBar隐藏并添加返回按钮
     if (self.viewControllers.count) {
         // 隐藏TabBar
         viewController.hidesBottomBarWhenPushed = YES;
         
         // 添加返回按钮
         viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalIcon:@"fanhui" highlightedIcon:@"fanhui" target:self action:@selector(backAction)];
     }
    
    [super pushViewController:viewController animated:animated];
}

-(BOOL)shouldAutorotate
{
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}

- (void)backAction {
    [self popViewControllerAnimated:YES];
}



@end
