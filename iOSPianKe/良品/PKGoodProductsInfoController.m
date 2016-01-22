//
//  PKGoodProductsInfoController.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/21.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKGoodProductsInfoController.h"

@interface PKGoodProductsInfoController()<UIWebViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic)                   UIScrollView *mainScroller;
@property (strong, nonatomic)                   UIWebView *htmlWebView;
@property (strong, nonatomic)                   NSDictionary *dataDic;
@property (strong, nonatomic)                   UILabel *fromLabel;
@property (strong, nonatomic)                   UILabel *whereFromLabel;
@property (strong, nonatomic)                   UILabel *sectionLabel;
@property (strong, nonatomic)                   UILabel *titleLabel;
@property (strong, nonatomic)                   UIImageView *iconImage;
@property (strong, nonatomic)                   UILabel *writeLabel;
@property (strong, nonatomic)                   UILabel *timeLabel;

@end

@implementation PKGoodProductsInfoController


- (void)viewDidLoad{
    [super viewDidLoad];
    //创建最下层的scrollerView，用来放全部的控件
    self.mainScroller = [[UIScrollView alloc]initWithFrame:self.view.frame];
    self.mainScroller.delegate = self;
    [self.view addSubview:self.mainScroller];
    //创建webView并添加到scroller上面
    self.htmlWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 170, VIEW_WIDTH, VIEW_HEIGHT)];
    self.htmlWebView.delegate = self;
    [self.mainScroller addSubview:self.htmlWebView];
    [self addHeadController];
    [self reloadData];
}

- (void)reloadData{
    //制作请求参数
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"contentid":self.contentID,
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/group/posts_info" dic:requestDic successBalck:^(id JSON) {
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            weakSelf.dataDic = [returnDic[@"data"] valueForKey:@"postsinfo"];
            NSString *htmlString = [self getHtmlString:weakSelf.dataDic[@"html"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.htmlWebView loadHTMLString:htmlString baseURL:nil];
            });
        }
    } errorBlock:^(NSError *error) {
        
    }];
}


-(NSString*)getHtmlString:(NSString *)routeName{
    
    NSMutableString *tmpMutable = [NSMutableString stringWithString:routeName];
    NSRange range = [tmpMutable rangeOfString:@"<a "];
    while (range.location != NSNotFound) {
        
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<a style=\"background:green; color:white; line-height:35px; border-radius:5px; height:50x; display:block;\" "];
        range = [tmpMutable rangeOfString:@"<a " options:NSLiteralSearch range:NSMakeRange(range.location+3, routeName.length-range.location-3)];
        
    }
    
    range = [tmpMutable rangeOfString:@"<img"];
    while (range.location != NSNotFound) {
        
        [tmpMutable replaceCharactersInRange:range
                                  withString:@"<img width=100% "];
        range = [tmpMutable rangeOfString:@"<img" options:NSLiteralSearch range:NSMakeRange(range.location+4, routeName.length-range.location-4)];
        
    }
    NSLog(@"%@",tmpMutable);
    return tmpMutable;
}
//添加头部的控件
/*
 @property (strong, nonatomic)                   NSDictionary *dataDic;
 @property (strong, nonatomic)                   UILabel *fromLabel;
 @property (strong, nonatomic)                   UILabel *whereFromLabel;
 @property (strong, nonatomic)                   UILabel *sectionLabel;
 @property (strong, nonatomic)                   UILabel *titleLabel;
 @property (strong, nonatomic)                   UIImageView *iconImage;
 @property (strong, nonatomic)                   UILabel *writeLabel;
 @property (strong, nonatomic)                   UILabel *timeLabel;

 */
- (void)addHeadController{
    self.fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 30, 13)];
    self.fromLabel.text = @"from:";
    self.fromLabel.textColor = [UIColor grayColor];
    self.fromLabel.font = [UIFont systemFontOfSize:11.0];
    [self.mainScroller addSubview:self.fromLabel];
    
    self.whereFromLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 20, VIEW_WIDTH/2-100, 13)];
    self.whereFromLabel.font = [UIFont systemFontOfSize:11.0];
    self.whereFromLabel.textColor = RGB(119, 182, 69);
    self.whereFromLabel.text = @"1231231212";
    [self.mainScroller addSubview:self.whereFromLabel];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, VIEW_WIDTH-40, 50)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:19.0];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.text =  @"dfgiocvj";
    [self.mainScroller addSubview:self.titleLabel];
    
    self.iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 110, 44, 44)];
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.cornerRadius = 22.0;
    self.iconImage.image = [UIImage imageNamed:@"头像"];
    [self.mainScroller addSubview:self.titleLabel];
    
    self.writeLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 120, VIEW_WIDTH-200, 14)];
    self.writeLabel.font = [UIFont systemFontOfSize:14.0];
    self.writeLabel.text = @"你好歹发生地方";
    [self.mainScroller addSubview:self.writeLabel];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_WIDTH - 100, 120, 100, 12)];
    self.timeLabel.font = [UIFont systemFontOfSize:13.0];
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.text = @"1213135";
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    [self.mainScroller addSubview:self.timeLabel];
    
}

// 网页加载完之后事件
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    CGRect frame = webView.frame;
    frame.size.width =VIEW_WIDTH;
    frame.size.height = 1;
    webView.scrollView.scrollEnabled = NO;
    webView.frame = frame;
    
    frame.size.height = webView.scrollView.contentSize.height;
    webView.frame = frame;
    _mainScroller.contentSize = CGSizeMake(0, frame.size.height + 170);

}
@end











