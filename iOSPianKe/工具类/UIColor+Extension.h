//
//  UIColor+Extension.h
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/18.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
