//
//  MK_ExceptionHandler.m
//  MK_CaptureCrash
//
//  Created by MK on 2018/4/16.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "MK_ExceptionHandler.h"

@implementation MK_ExceptionHandler
// 沙盒的地址
NSString * applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
// 崩溃时的回调函数
void UncaughtExceptionHandler(NSException * exception) {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason]; // // 崩溃的原因  可以有崩溃的原因(数组越界,字典nil,调用未知方法...) 崩溃的控制器以及方法
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    // 将一个txt文件写入沙盒
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"path------------:%@",path);
}
// 沙盒地址
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
+ (void)setDefaultHandler {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [path stringByAppendingPathComponent:@"Exception.txt"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    if (data != nil) {
        [[self alloc] sendExceptionLogWithData:data path:dataPath];
    }
}
- (void)sendExceptionLogWithData:(NSData *)data path:(NSString *)path {
    
    NSLog(@"发送数据");
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer.timeoutInterval = 5.0f;
    //    //告诉AFN，支持接受 text/xml 的数据
    //    [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    //    NSString *urlString = @"后台地址";
    //
    //    [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //        [formData appendPartWithFileData:data name:@"file" fileName:@"Exception.txt" mimeType:@"txt"];
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    //        // 删除文件
    //        NSFileManager *fileManger = [NSFileManager defaultManager];
    //        [fileManger removeItemAtPath:path error:nil];
    //
    //    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    //
    //
    //    }];
    
}
+ (NSUncaughtExceptionHandler *)getHandler {
    return NSGetUncaughtExceptionHandler();
}
+ (void)TakeException:(NSException *)exception {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason];
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
