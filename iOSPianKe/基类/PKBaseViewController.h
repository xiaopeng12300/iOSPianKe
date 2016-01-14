//
//  PKBaseViewController.h
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AFNetworking.h"
#import "RESideMenu.h"
#import "UIImageView+SDWedImage.h"
#import "UIView+Toast.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"
typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpErrorBlock)(NSError *error);

@interface PKBaseViewController : UIViewController

@property (copy, nonatomic)             HttpSuccessBlock successBlock;
@property (copy, nonatomic)             HttpErrorBlock errorBlock;


- (void)GETHttpRequest:(NSString *)url
                   dic:(NSDictionary *)dic
          successBalck:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError;

- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError;

- (void)AddBackItemBtn;
@end
