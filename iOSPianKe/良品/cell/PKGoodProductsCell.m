//
//  PKGoodProductsCell.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/20.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKGoodProductsCell.h"

@implementation PKGoodProductsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.contentImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, VIEW_WIDTH-40, 140)];
        [self addSubview:self.contentImage];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 160, VIEW_WIDTH-100, 60)];
        self.contentLabel.tintColor = [UIColor blackColor];
        self.contentLabel.font = [UIFont systemFontOfSize:14.0];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.contentLabel];
        
        self.bugLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_WIDTH-80, 174, 60, 25)];
        self.bugLabel.backgroundColor = RGB(119, 182, 69);
        self.bugLabel.font = [UIFont systemFontOfSize:13.0];
        self.bugLabel.text = @"立即购买";
        self.bugLabel.layer.masksToBounds = YES;
         self.bugLabel.layer.cornerRadius = 12.5;
        self.bugLabel.textAlignment = NSTextAlignmentCenter;
        self.bugLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.bugLabel];
        
        self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 219, VIEW_WIDTH, 0.5)];
        self.lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineLabel];
    }
    return self;
}

@end
