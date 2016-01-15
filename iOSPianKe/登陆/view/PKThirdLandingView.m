//
//  PKThirdLandingView.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"
@implementation PKThirdLandingView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.xinlangBtn];
        [self addSubview:self.renrenBtn];
        [self addSubview:self.doubanBtn];
        [self addSubview:self.tenentBtn];
        [self addSubview:self.lineLabel];
        [self addSubview:self.textLabel];
        [self addlayout];
        
        
    }
    return self;
}
-(void)addlayout{
    WS(weakSelf);
    CGFloat width = (VIEW_WIDTH-100.0)/5.0;
    [_xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_renrenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.xinlangBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_doubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.renrenBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_tenentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.doubanBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(125, 13));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(0.5);
        make.right.equalTo(weakSelf.mas_right).offset(-width);
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.centerY.equalTo(weakSelf.textLabel.mas_centerY);
    }];
    
}

- (UIButton *)xinlangBtn{
    if (!_xinlangBtn) {
        _xinlangBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_xinlangBtn setImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _xinlangBtn;
}
- (UIButton *)renrenBtn{
    if (!_renrenBtn) {
        _renrenBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_renrenBtn setImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _renrenBtn;
}
- (UIButton *)doubanBtn{
    if (!_doubanBtn) {
        _doubanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_doubanBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _doubanBtn;
}
- (UIButton *)tenentBtn{
    if (!_tenentBtn) {
        _tenentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_tenentBtn setImage:[UIImage imageNamed:@"QQ"] forState:(UIControlStateNormal)];
    }
    return _tenentBtn;
}
- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"合作伙伴登陆片刻";
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.backgroundColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _textLabel;
}

- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}

@end
