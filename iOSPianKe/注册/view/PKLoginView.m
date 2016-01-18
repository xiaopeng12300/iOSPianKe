//
//  PKLoginView.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/18.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginView.h"
#import "Masonry.h"
@interface PKLoginView()

@property (strong, nonatomic)               UILabel *lineLabel1;
@property (strong, nonatomic)               UILabel *lineLabel2;
@property (strong, nonatomic)               UILabel *lineLabel3;
@property (strong, nonatomic)               UILabel *usernameLabel;
@property (strong, nonatomic)               UILabel *emailLabel;
@property (strong, nonatomic)               UILabel *passwordLabel;
@property (strong, nonatomic)               UILabel *delegateLabel;

@end

@implementation PKLoginView
//320
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.usernameLabel];
        [self addSubview:self.emailText];
        [self addSubview:self.passwordText];
        [self addSubview:self.passwordLabel];
        [self addSubview:self.emailLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.manBtn];
        [self addSubview:self.womanBtn];
        [self addSubview:self.finishBtn];
        [self addSubview:self.delegateBtn];
        [self addSubview:self.delegateLabel];
        [self addLayoutIn];
    }
    return self;
}

- (void)addLayoutIn{
    WS(weakSelf);
    [_manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 25));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-100);
    }];
    
    [_womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 25));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(100);
    }];
    
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.manBtn.mas_bottom).offset(60);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(55);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];
    [_lineLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(55);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];
    [_usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel1.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-10);
    }];
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel2.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top).offset(-10);
    }];
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel3.mas_left);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(weakSelf.lineLabel3.mas_top).offset(-10);
    }];
    
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.usernameLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top);
    }];
    [_emailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.emailLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel2.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel3.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(weakSelf.lineLabel3.mas_top);
    }];
    
    [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(45);
        make.top.equalTo(weakSelf.lineLabel3.mas_bottom).offset(30);
    }];
    
    [_delegateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-50);
        make.size.equalTo(CGSizeMake(200, 15));
        make.top.equalTo(weakSelf.finishBtn.mas_bottom).offset(45);
    }];
    [_delegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.delegateLabel.mas_right).offset(20);
        make.size.equalTo(CGSizeMake(50, 15));
        make.top.equalTo(weakSelf.finishBtn.mas_bottom).offset(45);
    }];
}

- (UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel2;
}

- (UILabel *)lineLabel3{
    if (!_lineLabel3) {
        _lineLabel3 = [[UILabel alloc]init];
        _lineLabel3.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel3;
}

- (UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc]init];
        _usernameLabel.text = @"昵称:";
        _usernameLabel.textColor = [UIColor blackColor];
        _usernameLabel.textAlignment = NSTextAlignmentLeft;
        _usernameLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _usernameLabel;
}

- (UILabel *)emailLabel{
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc]init];
        _emailLabel.text = @"邮箱:";
        _emailLabel.textColor = [UIColor blackColor];
        _emailLabel.textAlignment = NSTextAlignmentLeft;
        _emailLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _emailLabel;
}

- (UILabel *)passwordLabel{
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc]init];
        _passwordLabel.text = @"密码";
        _passwordLabel.textColor = [UIColor blackColor];
        _passwordLabel.textAlignment = NSTextAlignmentLeft;
        _passwordLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _passwordLabel;
}

- (UIButton *)delegateBtn{
    if (!_delegateBtn) {
        _delegateBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_delegateBtn setTitle:@"片刻协议" forState:(UIControlStateNormal)];
        _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:11.0];
        [_delegateBtn setTitleColor:RGB(119, 182, 69) forState:(UIControlStateNormal)];
    }
    return _delegateBtn;
}
- (UILabel *)delegateLabel{
    if (!_delegateLabel) {
        _delegateLabel = [[UILabel alloc]init];
        _delegateLabel.text = @"点击“完成”按钮，代表您已阅读同意";
        _delegateLabel.textAlignment = NSTextAlignmentLeft;
        _delegateLabel.textColor = [UIColor blackColor];
        _delegateLabel.font = [UIFont systemFontOfSize:11.0];
    }
    return _delegateLabel;
}

- (UIButton *)manBtn{
    if (!_manBtn) {
        _manBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:(UIControlStateNormal)];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男_sel"] forState:(UIControlStateSelected)];
        _manBtn.selected = NO;
    }
    return _manBtn;
}
- (UIButton *)womanBtn{
    if (!_womanBtn) {
        _womanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:(UIControlStateNormal)];
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女_sel"] forState:(UIControlStateSelected)];
        _womanBtn.selected = NO;
    }
    return _womanBtn;
}
- (UIButton *)finishBtn{
    if (!_finishBtn) {
        _finishBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_finishBtn setTitleColor:RGB(119, 182, 69) forState:(UIControlStateNormal)];
        [_finishBtn setTitle:@"完成" forState:(UIControlStateNormal)];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _finishBtn;
}

- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc]init];
        _userNameText.borderStyle = UITextBorderStyleNone;
        _userNameText.textColor = [UIColor blackColor];
    }
    return _userNameText;
}

- (UITextField *)emailText{
    if (!_emailText) {
        _emailText = [[UITextField alloc]init];
        _emailText.borderStyle = UITextBorderStyleNone;
        _emailText.textColor = [UIColor blackColor];
    }
    return _emailText;
}

- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc]init];
        _passwordText.borderStyle = UITextBorderStyleNone;
        _passwordText.secureTextEntry = YES;
        _passwordText.textColor = [UIColor blackColor];
    }
    return _passwordText;
}
@end







