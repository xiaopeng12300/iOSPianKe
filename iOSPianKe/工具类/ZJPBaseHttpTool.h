//
//  ZJPBaseHttpTool.h
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/18.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <UIKit/UIKit.h>

@interface AFHttpClient : AFHTTPRequestOperationManager

+ (instancetype)sharedClient;

@end

typedef void (^HttpSuccessBlock) (id JSON);
typedef void (^HttpFailureBlock) (NSError *error);

@interface ZJPBaseHttpTool : NSObject

/**
 *  AFN get请求
 *
 *  @param path URL地址
 *
 *  @param params 请求参数 (NSDictionary)
 *
 *  @param success 请求成功返回值（NSArray or NSDictionary）
 *
 *  @param failure 请求失败值 (NSError)
 */
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;

/**
 *  AFN post请求
 *
 *  @param path URL地址
 *
 *  @param params 请求参数 (NSDictionary)
 *
 *  @param success 请求成功返回值（NSArray or NSDictionary）
 *
 *  @param failure 请求失败值 (NSError)
 */
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure;


/**
 *  AFN POST上传图片
 *
 *  @param path URL地址
 *
 *  @param params 请求参数 (NSDictionary)
 *
 *  @param success 请求成功返回值（NSArray or NSDictionary）
 *
 *  @param failure 请求失败值 (NSError)
 *
 *  @param imagePath 需要上传的图片数组，二进制格式的图片
 */
+ (void)postImagePath:(NSString *)path
               params:(NSDictionary *)params
                image:(NSString *)imagePath
              success:(HttpSuccessBlock)success
              failure:(HttpFailureBlock)failure;

/**
 *  AFN 下载
 *
 *  @param downloadURLString URL地址
 *
 *  @param targetPath 文件保存路径
 *
 */
+ (void)downloadWithURL:(NSString *)downloadURLString
             targetPath:(NSString *)targetPath;
@end






