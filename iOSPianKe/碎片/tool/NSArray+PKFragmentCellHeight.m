//
//  NSArray+PKFragmentCellHeight.m
//  iOSPianKe
//
//  Created by 赵金鹏 on 16/1/20.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "NSArray+PKFragmentCellHeight.h"
#import "PKFragmentModel.h"
#import "NSString+Helper.h"
@implementation NSArray (PKFragmentCellHeight)

+ (NSArray *)countCellHeight:(NSArray *)model{
    NSMutableArray *HeightArray = [NSMutableArray array];
    for (NSInteger i = 0; i <model.count; i ++) {
        PKFragmentList *list = model[i];
        CGFloat imageH = 0.0;
        CGFloat textH = 0.0;
        if (![list.coverimgWh isEmptyString]) {
            NSString *ImageSize = list.coverimgWh;
            NSArray *array = [ImageSize componentsSeparatedByString:@"*"];
            imageH = [array[1] floatValue]*((VIEW_WIDTH-40.0)/[array[0] floatValue]);
        }
        
        NSNumber *imageHeight = [NSNumber numberWithFloat:imageH];
        if (![list.content isEmptyString]) {
            textH = [NSString autoHeightWithString:list.content Width:VIEW_WIDTH-50 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]];
        }
        NSNumber *textHeight = [NSNumber numberWithFloat:textH];
        NSNumber *cellHeight = [NSNumber numberWithFloat:imageH+textH+150.0];
        NSDictionary *heightDic = @{@"imageHeight":imageHeight,@"textHeight":textHeight,@"cellHeight":cellHeight};
        [HeightArray addObject:heightDic];
    }
    return HeightArray;
}


@end
