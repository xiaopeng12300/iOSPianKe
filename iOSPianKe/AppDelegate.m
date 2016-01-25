//
//  AppDelegate.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"//抽屉第三方头文件
#import "PKHomeViewController.h"//首页
#import "PKLeftMenuViewController.h"//左菜单
#import "ZJPNavigationController.h"//自定义的nav
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    NSLog(@"111");
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"2222");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ZJPNavigationController *navigationController = [[ZJPNavigationController alloc] initWithRootViewController:[[PKHomeViewController alloc] init]];
    PKLeftMenuViewController *leftMenuViewController = [[PKLeftMenuViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:nil];
    
    
//    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.contentViewScaleValue = 1;//缩放比列
    sideMenuViewController.contentViewInPortraitOffsetCenterX = VIEW_WIDTH/2-45;//偏移量
    self.window.rootViewController = sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self addLaunchingImage];
    return YES;
}
//启动图放大
- (void)addLaunchingImage{
    UIImageView *launchingImage = [[UIImageView alloc]initWithFrame:self.window.frame];
    launchingImage.image = [UIImage imageNamed:@"LaunchImage"];
    [self.window addSubview:launchingImage];
   __block CGRect launchingImageRect = launchingImage.bounds;

    [UIView animateWithDuration:3 animations:^{
        //让launchingImage的frame变大
        launchingImageRect = CGRectMake(-40, -40, VIEW_WIDTH + 80, VIEW_HEIGHT + 80);
        //将新的frame赋值给launchingImage
        launchingImage.frame = launchingImageRect;
    } completion:^(BOOL finished) {
        //判断动画是否执行完成
        if (finished) {
            //如果执行完成就将透明度设置成0，使其缓慢消失
            [UIView animateWithDuration:1 animations:^{
                launchingImage.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    //动画执行完成后将其移除
                    [launchingImage removeFromSuperview];
                }
            }];
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
