//
//  PKEmailLandingView.h
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKEmailLandingView : UIView<UITextFieldDelegate>

@property (strong, nonatomic)           UILabel *lineLabel1;
@property (strong, nonatomic)           UILabel *lineLabel2;
@property (strong, nonatomic)           UILabel *tostLabel1;
@property (strong, nonatomic)           UILabel *tostLabel2;
@property (strong, nonatomic)           UITextField *emailText;
@property (strong, nonatomic)           UITextField *passwordText;
@property (strong, nonatomic)           UIButton *landingBtn;;


@end






