//
//  ViewController.m
//  MK_CaptureCrash
//
//  Created by MK on 2018/4/16.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)handleTapButton:(UIButton *)sender {
    //常见异常1---不存在方法引用
    
        [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    
//        [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    
    [[NSArray array] objectAtIndex:1];
    
    //常见异常4---memory warning 级别3以上
    
//        [self performSelector:@selector(killMemory) withObject:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
