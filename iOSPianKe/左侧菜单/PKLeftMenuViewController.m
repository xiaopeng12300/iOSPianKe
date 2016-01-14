//
//  PKLeftMenuViewController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadView.h"//头部view
#import "PKLeftTableView.h"//列表选项
@interface PKLeftMenuViewController ()

@property (strong, nonatomic)           PKLeftHeadView *leftheadView;
@property (strong, nonatomic)           PKLeftTableView *leftTable;
@end

@implementation PKLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(51, 51, 51);
    [self.view addSubview:self.leftheadView];
    WS(weakSelf);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(180);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    [self.view addSubview:self.leftTable];
    // Do any additional setup after loading the view.
}

- (PKLeftHeadView *)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        
    }
    return _leftheadView;
}

- (PKLeftTableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 165, VIEW_WIDTH-45, VIEW_HEIGHT-165) style:(UITableViewStylePlain)];
    }
    return _leftTable;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
