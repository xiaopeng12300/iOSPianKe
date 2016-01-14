//
//  ZJPBaseHttpTool.m
//  HaveFace
//
//  Created by 赵金鹏 on 15/11/18.
//  Copyright © 2015年 赵金鹏. All rights reserved.
//

#import "ZJPBaseHttpTool.h"
#import "AFNetworking.h"
#import "AFDownloadRequestOperation.h"
#define REQUESTURL @""
// 服务器地址
static NSString *const kBaseURLString = REQUESTURL;

@implementation AFHttpClient

+ (instancetype)sharedClient{
    
    static AFHttpClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFHttpClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/javascript",@"text/plain", nil];
        
    });
    return _sharedClient;
}

@end

@implementation ZJPBaseHttpTool

#pragma mark - AFN网络请求
#pragma mark POST请求
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {
    AFHttpClient *manager = [AFHttpClient sharedClient];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return;
        success(responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return;
        failure(error);
    }];
}

#pragma mark GET请求
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    AFHttpClient *manager = [AFHttpClient sharedClient];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return;
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return;
        failure(error);
    }];
}

#pragma mark POST上传图片
+ (void)postImagePath:(NSString *)path
              params:(NSDictionary *)params
                image:(NSString *)imagePath
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {
    AFHttpClient *manager = [AFHttpClient sharedClient];
    path = [NSString stringWithFormat:@"http://api2.pianke.me/user/reg"];
    [manager POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:@"iconfile" fileName:imagePath mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return;
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return;
        failure(error);
    }];
}

//第一个参数是下载地址，第二个参数是下载成功后文件保存的路径
+ (void)downloadWithURL:(NSString *)downloadURLString targetPath:(NSString *)targetPath {
    
    NSURL *downloadURL = [NSURL URLWithString:downloadURLString];
    NSURLRequest *downloadRequest = [[NSURLRequest alloc]initWithURL:downloadURL] ;
    //创建下载任务
    AFDownloadRequestOperation *downloadOperation = [[AFDownloadRequestOperation alloc]initWithRequest:downloadRequest  targetPath:targetPath shouldResume:YES];
    
    //设置进度
    [downloadOperation setProgressiveDownloadProgressBlock:^(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile) {
        
    }];
    //可以覆盖
    [downloadOperation setShouldOverwrite:YES];
    //设置完成任务
    [downloadOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //下载成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //下载失败
    }];
    
    //设置background下载
    [downloadOperation setShouldExecuteAsBackgroundTaskWithExpirationHandler:^{
        
    }];
}
@end






