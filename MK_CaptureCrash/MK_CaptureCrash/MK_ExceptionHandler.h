//
//  MK_ExceptionHandler.h
//  MK_CaptureCrash
//
//  Created by MK on 2018/4/16.
//  Copyright © 2018年 MK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MK_ExceptionHandler : NSObject
+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)getHandler;
+ (void)TakeException:(NSException *) exception;
@end
