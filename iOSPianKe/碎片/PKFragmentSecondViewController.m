//
//  PKFragmentSecondViewController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/22.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKFragmentSecondViewController.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "PKFragmentTableCell.h"
@interface PKFragmentSecondViewController()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)               UITableView *fragmentTable;
@property (strong, nonatomic)               NSMutableArray *FragmentModel;//碎片数据
@property (strong, nonatomic)               NSMutableArray *cellHeightArray;//高度数组
@property (assign, nonatomic)               NSInteger pageNumber;
@end




@implementation PKFragmentSecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.fragmentTable = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.fragmentTable.delegate = self;
    self.fragmentTable.dataSource = self;
    self.fragmentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.fragmentTable];
    //添加mj刷新
    [self addRefreshControl];
    //上拉加载的页码
    self.pageNumber = 0;
    //请求数据的方法
    [self reloadFragmentTabelData:_pageNumber];
    // Do any additional setup after loading the view.
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
            //获取需要的数组
            NSArray *dataArray = [returnDic[@"data"] valueForKey:@"list"];
            //tableview用来存储数据的数组
            if (!weakSelf.FragmentModel) {
                weakSelf.FragmentModel = [NSMutableArray array];
                weakSelf.FragmentModel = [NSMutableArray arrayWithArray:dataArray];
                weakSelf.pageNumber = 10;
            }else{
                //将数据添加到之前的数组里面
                [weakSelf.FragmentModel addObjectsFromArray:dataArray];
                //如果不是第一次加载，就将页码不断的加10
                weakSelf.pageNumber += 10;
            }
            if (!weakSelf.cellHeightArray) {
                weakSelf.cellHeightArray = [NSMutableArray array];
                weakSelf.cellHeightArray = [NSMutableArray arrayWithArray:[self countCellHeight:dataArray]];
            }else{
                //给tableviewcell高度的数组赋值
                [weakSelf.cellHeightArray addObjectsFromArray:[self countCellHeight:dataArray]];

            }
            //刷新tableview
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
- (void)addRefreshControl {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    self.fragmentTable.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    footer.stateLabel.hidden = YES;
    self.fragmentTable.mj_footer.automaticallyChangeAlpha = YES;
    self.fragmentTable.mj_footer = footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据高度数组中元素的个数来确定tableview显示cell的数量
    return _cellHeightArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [[_cellHeightArray[indexPath.row] valueForKey:@"cellHeight"] floatValue];
    NSLog(@"heitht %lf",height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    PKFragmentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[PKFragmentTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    //传给cell的高度字典
    cell.heightDic = _cellHeightArray[indexPath.row];
    //传给cell的内容模型
    cell.dataDic = _FragmentModel[indexPath.row];
    return cell;
}
//下拉刷新全部数据
- (void)loadMoreData{
    //每次调用下拉刷新，需要将页码归零
    _pageNumber = 0;
    [self reloadFragmentTabelData:_pageNumber];
}
//上拉加载更多数据

- (void)loadNewData{
    [self reloadFragmentTabelData:_pageNumber];
}
//计算高度的方法
- (NSArray *)countCellHeight:(NSArray *)model{
    //创建存储数据的数组
    NSMutableArray *HeightArray = [NSMutableArray array];
    //便利数组
    for (NSInteger i = 0; i <model.count; i ++) {
        
        NSDictionary *list = model[i];
        CGFloat imageH = 0.0;
        CGFloat textH = 0.0;
        //判断是否为空
        if (![list[@"coverimg_wh"] isEmptyString]) {
            NSString *ImageSize = list[@"coverimg_wh"];
            //字符串截取
            NSArray *array = [ImageSize componentsSeparatedByString:@"*"];
            //根据宽高比计算高度
            imageH = [array[1] floatValue]*((VIEW_WIDTH-40.0)/[array[0] floatValue]);
        }
        //转换成number类型数据存入字典
        NSNumber *imageHeight = [NSNumber numberWithFloat:imageH];
        if (![list[@"content"] isEmptyString]) {
            textH = [NSString autoHeightWithString:list[@"content"] Width:VIEW_WIDTH-50 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]];
        }
        NSNumber *textHeight = [NSNumber numberWithFloat:textH];
        NSNumber *cellHeight = [NSNumber numberWithFloat:imageH+textH+150.0];
        NSDictionary *heightDic = @{@"imageHeight":imageHeight,@"textHeight":textHeight,@"cellHeight":cellHeight};
        [HeightArray addObject:heightDic];
    }
    return HeightArray;
}

@end
