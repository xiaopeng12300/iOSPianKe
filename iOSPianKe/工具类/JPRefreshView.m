//
//  JPRefreshView.m
//  PianKe
//
//  Created by 赵金鹏 on 15/12/3.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import "JPRefreshView.h"

#define Refrsh_WIDTH 100
#define Refrsh_HEIGHT 100

#define IMAGEVIEW_WIDTH 80
#define IMAGEVIEW_HEIGHT 80

#define MARK_WORD_HEIGHT 20
#define MARK_WORD @"" //提示文字

@interface JPRefreshView()

@property (nonatomic, strong) UIImageView                * imageView;
@property (nonatomic, strong) UIView                     * refreshview;
@property (nonatomic, strong) UILabel                    * label;

@end

@implementation JPRefreshView

+ (void)showJPRefreshFromView:(UIView *)superView offSetY:(CGFloat)offSetY {
    
    JPRefreshView *jpRefreshView = [JPRefreshView new];
    //设置刷新视图的坐标在父视图的中心
//    dvRefreshView.frame = CGRectMake(superView.frame.size.width / 2 - Refrsh_WIDTH / 2,
//                                     (superView.frame.size.height) / 2 - Refrsh_HEIGHT / 2 + offSetY,
//                                     Refrsh_WIDTH,
//                                     Refrsh_HEIGHT);
    jpRefreshView.frame = [[UIScreen mainScreen] bounds];
    //如果父视图中已经有了，则先移除
    [JPRefreshView removeJPRefreshFromView:superView];
    //添加进父视图
    [superView addSubview:jpRefreshView];
    //开始播放图片
    [jpRefreshView.imageView startAnimating];
    
//        dvRefreshView.backgroundColor = [UIColor redColor];
//        dvRefreshView.imageView.backgroundColor = [UIColor orangeColor];
//        dvRefreshView.label.backgroundColor = [UIColor blueColor];

}

+ (void)showJPRefreshFromView:(UIView *)superView {
    
    [self showJPRefreshFromView:superView offSetY:0];
}

+ (void)removeJPRefreshFromView:(UIView *)superView {
    
    //从父视图中移除
    for (UIView *itemView in superView.subviews) {
        if ([itemView isKindOfClass:[JPRefreshView class]]) {
            [itemView removeFromSuperview];
        }
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGBAlpha(0, 0, 0, 0.2);
        [self addSubview:self.refreshview];
        [_refreshview addSubview:self.imageView];
//        [self addSubview:self.label];
    }
    return self;
}
- (UIView *)refreshview{
    if (!_refreshview) {
        _refreshview = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2 - Refrsh_WIDTH/2, VIEW_HEIGHT/2 - Refrsh_HEIGHT/2, Refrsh_WIDTH, Refrsh_HEIGHT)];
        _refreshview.backgroundColor = RGB(26, 21, 37);
        _refreshview.layer.masksToBounds = YES;
        _refreshview.layer.cornerRadius = 10;
    }
    return _refreshview;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.frame = CGRectMake(Refrsh_WIDTH / 2 - IMAGEVIEW_WIDTH / 2,
                                      5,
                                      IMAGEVIEW_WIDTH,
                                      IMAGEVIEW_HEIGHT);
        _imageView.backgroundColor = [UIColor clearColor];
        
        _imageView.animationImages = [self refreshIamgesArray];
        _imageView.animationDuration = 2;
        _imageView.animationRepeatCount = 0;
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.font = [UIFont systemFontOfSize:14];
//        _label.text = @"fadfasdfadsfa";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor grayColor];
        _label.frame = CGRectMake(0, IMAGEVIEW_HEIGHT, Refrsh_WIDTH, MARK_WORD_HEIGHT);
    }
    return _label;
}

//得到刷新图片数组
- (NSArray *)refreshIamgesArray {
    
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i <= 14; i++) {
        NSString *name = [NSString stringWithFormat:@"loading_animate_%i",i];
        [marr addObject:name];
    }
    NSMutableArray *marrImages = [NSMutableArray array];
    for (NSString *str in marr) {
        UIImage *image = [UIImage imageNamed:str];
        [marrImages addObject:image];
    }
    return marrImages;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
