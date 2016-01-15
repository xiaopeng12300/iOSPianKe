//
//  PKLeftMusicView.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftMusicView.h"
#import "Masonry.h"
@implementation PKLeftMusicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicFrom];
        [self addSubview:self.musicName];
        [self addSubview:self.startBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    WS(ws);
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.mas_centerY);
        make.right.mas_equalTo(ws.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).offset(10);
        make.centerY.equalTo(ws.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(ws.musicImage.mas_right).offset(10);
        make.centerY.equalTo(ws.mas_centerY).offset(-8);
        make.height.equalTo(16);
        make.right.equalTo(ws.startBtn.mas_left).offset(-20);
    }];
    
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_equalTo(ws.musicImage.mas_right).offset(10);
        make.right.equalTo(ws.startBtn.mas_left).offset(-20);
        make.centerY.equalTo(ws.mas_centerY).offset(8);
        make.height.equalTo(11);
    }];
}

- (UIImageView *)musicImage{
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐"]];
    }
    return _musicImage;
}

- (UILabel *)musicName{
    if (!_musicName) {
        _musicName = [[UILabel alloc]init];
        _musicName.textColor = [UIColor whiteColor];
        _musicName.textAlignment = NSTextAlignmentLeft;
        _musicName.text = @"12345";
        _musicName.font = [UIFont systemFontOfSize:15.0];
    }
    return _musicName;
}

- (UILabel *)musicFrom{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        _musicFrom.text = @"1111111";
        _musicFrom.font = [UIFont systemFontOfSize:10.0];
    }
    return _musicFrom;
}

- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _startBtn.selected = NO;
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:(UIControlStateNormal)];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:(UIControlStateSelected)];
    }
    return _startBtn;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _backBtn.backgroundColor = RGB(28, 28, 28);
    }
    return _backBtn;
}
@end











