//
//  PKLoginView.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/18.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginView.h"

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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor lightGrayColor];
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
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"难_sel"] forState:(UIControlStateSelected)];
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







