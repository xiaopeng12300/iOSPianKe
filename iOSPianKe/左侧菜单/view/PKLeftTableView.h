//
//  PKLeftTableView.h
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKLeftTableViewSelectRow <NSObject>

- (void)selectWhichRow:(NSInteger)row;

@end

@interface PKLeftTableView : UITableView

@property (weak, nonatomic)         id<PKLeftTableViewSelectRow>RowDelegate;

@end
