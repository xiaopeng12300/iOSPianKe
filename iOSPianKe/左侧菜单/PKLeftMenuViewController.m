//
//  PKLeftMenuViewController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadView.h"//头部view
#import "PKLeftTableView.h"//列表选项
#import "PKLeftMusicView.h"//底部音乐播放器
#import "PKLandingViewController.h"//登陆界面
#import "ZJPNavigationController.h"//导航
#import "PKSettingViewController.h"//设置
#import "PKGoodProductsViewController.h"//良品
#import "PKCommunityViewController.h"//社区
#import "PKReadViewController.h"//阅读
#import "PKRadioViewController.h"//电台
#import "PKFragmentViewController.h"//碎片
#import "PKHomeViewController.h"//首页
#import "PKFragmentSecondViewController.h"//碎片不分层

@interface PKLeftMenuViewController ()<PKLeftTableViewSelectRow>

@property (strong, nonatomic)           PKLeftHeadView *leftheadView;
@property (strong, nonatomic)           PKLeftTableView *leftTable;
@property (strong, nonatomic)           PKLeftMusicView * leftMusic;

@end

@implementation PKLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(51, 51, 51);
    [self.view addSubview:self.leftheadView];
    WS(weakSelf);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(190);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    [self.view addSubview:self.leftTable];
    [_leftTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftheadView.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
    }];
    
    [self.view addSubview:self.leftMusic];
    [_leftMusic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
        make.height.mas_equalTo(@60);
    }];
}
//侧边顶部信息view
- (PKLeftHeadView *)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        [_leftheadView.iconImageBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:(UIControlEventTouchUpInside)];
        [_leftheadView.userNameBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _leftheadView;
}
//中间切换试图的列表
- (PKLeftTableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:(UITableViewStylePlain)];
        _leftTable.RowDelegate = self;
    }
    return _leftTable;
}

- (PKLeftMusicView*)leftMusic
{
    if (!_leftMusic)
    {
        _leftMusic = [[PKLeftMusicView alloc] init];
    }
    return _leftMusic;
}

#pragma mark - RowDelegate
//执行跳转的代理方法
- (void)selectWhichRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            //初始化页面
            PKHomeViewController *homeController = [[PKHomeViewController alloc]init];
            homeController.title = @"首页";
            //设置根视图
            ZJPNavigationController *homeNav = [[ZJPNavigationController alloc]initWithRootViewController:homeController];
            //进行页面跳转
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            //隐藏侧边菜单
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 1:
        {
            PKRadioViewController *radioController = [[PKRadioViewController alloc]init];
            radioController.title = @"电台";
            ZJPNavigationController *radioNav = [[ZJPNavigationController alloc]initWithRootViewController:radioController];
            [self.sideMenuViewController setContentViewController:radioNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 2:
        {
            PKReadViewController *readController = [[PKReadViewController alloc]init];
            readController.title = @"阅读";
            ZJPNavigationController *readNav = [[ZJPNavigationController alloc]initWithRootViewController:readController];
            [self.sideMenuViewController setContentViewController:readNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 3:
        {
            PKCommunityViewController *CommunityController = [[PKCommunityViewController alloc]init];
            CommunityController.title = @"社区";
            ZJPNavigationController *CommunityNav = [[ZJPNavigationController alloc]initWithRootViewController:CommunityController];
            [self.sideMenuViewController setContentViewController:CommunityNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 4:
        {
            PKFragmentViewController *FragmentController = [[PKFragmentViewController alloc]init];
            FragmentController.title = @"碎片";
            ZJPNavigationController *FragmentNav = [[ZJPNavigationController alloc]initWithRootViewController:FragmentController];
            [self.sideMenuViewController setContentViewController:FragmentNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 5:
        {
            PKFragmentSecondViewController *FragmentController = [[PKFragmentSecondViewController alloc]init];
            FragmentController.title = @"碎片不分层";
            ZJPNavigationController *FragmentNav = [[ZJPNavigationController alloc]initWithRootViewController:FragmentController];
            [self.sideMenuViewController setContentViewController:FragmentNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 6:
        {
            PKGoodProductsViewController *GoodProductsController = [[PKGoodProductsViewController alloc]init];
            GoodProductsController.title = @"良品";
            ZJPNavigationController *GoodProductsNav = [[ZJPNavigationController alloc]initWithRootViewController:GoodProductsController];
            [self.sideMenuViewController setContentViewController:GoodProductsNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 7:
        {
            PKSettingViewController *SettingeController = [[PKSettingViewController alloc]init];
            SettingeController.title = @"设置";
            ZJPNavigationController *SettingNav = [[ZJPNavigationController alloc]initWithRootViewController:SettingeController];
            [self.sideMenuViewController setContentViewController:SettingNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            
        default:
            break;
    }
}

- (void)pushToLandingViewController{
    PKLandingViewController *landing = [[PKLandingViewController alloc]init];
    [self presentViewController:landing animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
