//
//  PKHomeFragmentTable.h
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/19.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentTable.h"//碎片数据
typedef void(^loadNewDataBlock)();//加载新数据
typedef void(^loadMoreDataBlock)();//加载更多数据



@interface PKFragmentTable : UITableView

@property (strong, nonatomic)           NSArray *FragmentModel;
@property (strong, nonatomic)           NSArray *cellHeightArray;
@property (copy, nonatomic)             loadNewDataBlock NewDataBlock;
@property (copy, nonatomic)             loadMoreDataBlock MoreDataBlock;

@end
