//
//  PKFragmentTableCell.h
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/20.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentModel.h"
@interface PKFragmentTableCell : UITableViewCell

@property (strong, nonatomic)               PKFragmentList *counterList;
@property (strong, nonatomic)               NSDictionary *heightDic;
@property (strong, nonatomic)               NSDictionary *dataDic;//不用model用字典进行赋值时用的数据

@end
