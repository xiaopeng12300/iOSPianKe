//
//  UIImage+Helper.m
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/18.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)

#pragma mark 默认从图片中心点开始拉伸图片
+ (UIImage *)resizedImage:(NSString *)imgName {
    return [self resizedImage:imgName xPos:0.5 yPos:0.5];
}

#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos {
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * xPos topCapHeight:image.size.height * yPos];
}


@end
