//
//  PKLandingViewController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKThirdLandingView.h"//第三方登录view
#import "PKEmailLandingView.h"//邮箱正常登陆
@interface PKLandingViewController ()
@property (strong, nonatomic)PKThirdLandingView *thirdLandingView;
@property (strong, nonatomic)           PKEmailLandingView *emailLandingView;
@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  addSubview:self.thirdLandingView];
    WS(weakSelf);
    [_thirdLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(105);
    }];
    [self.view addSubview:self.emailLandingView];
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdLandingView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(170);
    }];
    
}

//底部第三方登录view
- (PKThirdLandingView *)thirdLandingView{
    if (!_thirdLandingView) {
        _thirdLandingView = [[PKThirdLandingView alloc]init];
    }
    return _thirdLandingView;
}
- (PKEmailLandingView *)emailLandingView{
    if (!_emailLandingView) {
        _emailLandingView = [[PKEmailLandingView alloc]init];
    }
    return _emailLandingView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
