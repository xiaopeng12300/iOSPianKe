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
    //创建存储数据的数组
    NSMutableArray *HeightArray = [NSMutableArray array];
    //便利数组
    for (NSInteger i = 0; i <model.count; i ++) {
        
        PKFragmentList *list = model[i];
        CGFloat imageH = 0.0;
        CGFloat textH = 0.0;
        //判断是否为空
        if (![list.coverimgWh isEmptyString]) {
            NSString *ImageSize = list.coverimgWh;
            //字符串截取
            NSArray *array = [ImageSize componentsSeparatedByString:@"*"];
            //根据宽高比计算高度
            imageH = [array[1] floatValue]*((VIEW_WIDTH-40.0)/[array[0] floatValue]);
        }
        //转换成number类型数据存入字典
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
