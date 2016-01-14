//
//  PKLeftHeadView.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftHeadView.h"
#import "Masonry.h"
@implementation PKLeftHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImage];
        [self addSubview:self.iconImageBtn];
        [self addSubview:self.userNameBtn];
        [self addSubview:self.downBtn];
        [self addSubview:self.collecBtn];
        [self addSubview:self.messageBtn];
        [self addSubview:self.writeBtn];
        [self addSubview:self.searchBtn];
        [self addAutoLayout];
    }
    return self;
}

- (void)addAutoLayout{
    WS(weakSelf);
    [_iconImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 50));
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.left.equalTo(weakSelf.mas_left).offset(20);
    }];
    
    [_userNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImageBtn.mas_right).offset(10);
        make.height.equalTo(20);
        make.right.equalTo(weakSelf.mas_right).offset(-60);
        make.centerY.equalTo(weakSelf.iconImageBtn.mas_centerY);
    }];
    CGFloat width = (VIEW_WIDTH-125.0)/5.0;
    [_downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.top.equalTo(weakSelf.iconImageBtn.mas_bottom).offset(25);
    }];
    [_collecBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.downBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakSelf.downBtn.mas_centerY);
    }];
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.collecBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakSelf.collecBtn.mas_centerY);
    }];
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.messageBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakSelf.messageBtn.mas_centerY);
    }];
    
    [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.messageBtn.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-25);
        make.height.equalTo(30);
    }];
    [_backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"侧边头部背景"]];
    }
    return _backImage;
}

- (UIButton *)iconImageBtn{
    if (!_iconImageBtn) {
        _iconImageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_iconImageBtn setImage:[UIImage imageNamed:@"头像"] forState:(UIControlStateNormal)];
        _iconImageBtn.layer.cornerRadius = 25.0;
        _iconImageBtn.layer.masksToBounds = YES;
    }
    return _iconImageBtn;
}

- (UIButton *)userNameBtn{
    if (!_userNameBtn) {
        _userNameBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_userNameBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_userNameBtn setTitle:@"登陆｜注册" forState:(UIControlStateNormal)];
        _userNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _userNameBtn;
}

- (UIButton *)downBtn{
    if (!_downBtn) {
        _downBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_downBtn setBackgroundImage:[UIImage imageNamed:@"下载"] forState:(UIControlStateNormal)];
    }
    return _downBtn;
}

- (UIButton *)collecBtn{
    if (!_collecBtn) {
        _collecBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_collecBtn setBackgroundImage:[UIImage imageNamed:@"收藏"] forState:(UIControlStateNormal)];
    }
    return _collecBtn;
}

- (UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_messageBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:(UIControlStateNormal)];
    }
    return _messageBtn;
}

- (UIButton *)writeBtn{
    if (!_writeBtn) {
        _writeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_writeBtn setBackgroundImage:[UIImage imageNamed:@"写评论"] forState:(UIControlStateNormal)];
    }
    return _writeBtn;
}

- (UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_searchBtn setBackgroundImage:[UIImage imageNamed:@"搜索"] forState:(UIControlStateNormal)];
    }
    return _searchBtn;
}
@end













