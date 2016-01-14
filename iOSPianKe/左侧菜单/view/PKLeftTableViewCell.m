//
//  PKLeftTableViewCell.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftTableViewCell.h"
#import "Masonry.h"
@implementation PKLeftTableViewCell



- (void)awakeFromNib {
    
    UIImageView *imagepk = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"电台"]];
    self.imagepk = imagepk;
    [self addSubview:imagepk];

    UILabel *labelpk = [[UILabel alloc] init];
    labelpk.text = @"电台";
    self.labelpk = labelpk;
    [self addSubview:labelpk];
    
    WS(weakSelf);
    
    [imagepk mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.mas_left).offset(25);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
        
    }];
    [labelpk mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(imagepk.mas_right).offset(25);
        make.centerY.equalTo(imagepk.mas_centerY);
        make.size.equalTo(CGSizeMake(40,30));
    }];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
