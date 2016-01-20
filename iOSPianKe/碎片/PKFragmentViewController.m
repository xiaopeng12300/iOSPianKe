//
//  PKFragmentViewController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/19.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKFragmentViewController.h"
#import "PKFragmentTable.h"
#import "MJRefresh.h"
#import "PKFragmentModel.h"
#import "NSArray+PKFragmentCellHeight.h"
@interface PKFragmentViewController ()
@property (strong, nonatomic)               PKFragmentTable *fragmentTable;
@property (strong, nonatomic)               PKFragmentModel *FragmentModel;
@end

@implementation PKFragmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.fragmentTable];
    [self addAutoLayout];
    [self reloadFragmentTabelData:0];
    // Do any additional setup after loading the view.
}

- (void)addAutoLayout{
    WS(weakSelf);
    [_fragmentTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (PKFragmentTable *)fragmentTable{
    if (!_fragmentTable) {
        _fragmentTable = [[PKFragmentTable alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:(UITableViewStylePlain)];
        WS(weakSelf);
        _fragmentTable.MoreDataBlock = ^(){
            // 隐藏当前的上拉刷新控件
            [weakSelf reloadFragmentTabelData:0];
        };
        _fragmentTable.NewDataBlock = ^(){
            [weakSelf reloadFragmentTabelData:10];
        };
    }
    return _fragmentTable;
}

- (void)reloadFragmentTabelData:(NSInteger)start{
    //制作请求参数
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":@"10",
                                 @"start":[NSString stringWithFormat:@"%li",start],
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    //开始网络请求
    [self POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:requestDic successBalck:^(id JSON) {
        NSLog(@"%@",JSON);
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            //将得到的模型转换成model
            weakSelf.FragmentModel = [[PKFragmentModel alloc]initWithDictionary:returnDic];
            NSArray *heightArray = [NSArray countCellHeight:weakSelf.FragmentModel.data.list];
            
            //tableview用来存储数据的数组
            weakSelf.fragmentTable.FragmentModel = weakSelf.FragmentModel.data.list;
            weakSelf.fragmentTable.cellHeightArray = heightArray;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.fragmentTable reloadData];
            });
            
        }
        //结束刷新状态
        [weakSelf.fragmentTable.mj_footer endRefreshing];
        [weakSelf.fragmentTable.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"-----------%@",error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
