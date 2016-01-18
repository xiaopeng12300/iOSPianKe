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
#import "PKLoginViewController.h"//注册页面
@interface PKLandingViewController ()<UITextFieldDelegate>
@property (strong, nonatomic)PKThirdLandingView *thirdLandingView;
@property (strong, nonatomic)           PKEmailLandingView *emailLandingView;
@property (strong, nonatomic)           UIImageView *iconImage;
@property (strong, nonatomic)           UIButton *returnBtn;
@property (strong, nonatomic)           UIButton *loginBtn;

@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view  addSubview:self.thirdLandingView];
    
    [self.view addSubview:self.emailLandingView];
    
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.returnBtn];
    [self.view addSubview:self.iconImage];
    [self addAutoLayoutIn];
}

- (void)addAutoLayoutIn{
    WS(weakSelf);
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdLandingView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(170);
    }];
    [_thirdLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(105);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(40, 20));
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
    }];
    
    [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(40, 20));
        make.left.equalTo(weakSelf.view.mas_left).offset(20);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
    }];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 50));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-100);
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
        _emailLandingView.emailText.delegate = self;
        _emailLandingView.passwordText.delegate = self;
    }
    return _emailLandingView;
}

//图标
- (UIImageView *)iconImage{
    if (!_iconImage ) {
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
    }
    return _iconImage;
}
//注册
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_loginBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_loginBtn addTarget:self action:@selector(pushToLoginViewController) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginBtn;
}


- (UIButton *)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
        [_returnBtn addTarget:self action:@selector(returnViewMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _returnBtn;
}

- (void)returnViewMethod{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _emailLandingView.emailText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
//进入注册页面
- (void)pushToLoginViewController{
    PKLoginViewController *loginView = [[PKLoginViewController alloc]init];
    [self presentViewController:loginView animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end




