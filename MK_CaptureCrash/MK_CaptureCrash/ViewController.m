//
//  ViewController.m
//  MK_CaptureCrash
//
//  Created by MK on 2018/4/16.
//  Copyright © 2018年 MK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self CAGradientLayer];
}
- (IBAction)handleTapButton:(UIButton *)sender {
    //常见异常1---不存在方法引用
    
        [self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    
//        [[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    
//    [[NSArray array] objectAtIndex:1];
    
    //常见异常4---memory warning 级别3以上
    
//        [self performSelector:@selector(killMemory) withObject:nil];
    
    
}
- (void)CAGradientLayer{
    [self.view addSubview:self.containerView];
    //*****
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:1].CGColor,
                             (__bridge id) [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.8].CGColor,
                             (__bridge id) [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.6].CGColor,
                             (__bridge id)[UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.4].CGColor,
                             (__bridge id)[UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor];
    
    //set locations
    //    gradientLayer.locations = @[@0.2, @0.4, @0.6, @0.8,@1];
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [self textLayer];
    //*****
}
- (void)textLayer{
    //create a text layer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(15, 15, self.containerView.frame.size.width-30, self.containerView.frame.size.height);
    [self.containerView.layer addSublayer:textLayer];
    
    //set text attributes
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;//对齐
    textLayer.wrapped = YES;//自动换行
    textLayer.truncationMode = kCATruncationEnd;//裁剪方式
    
    
    //choose a font
    UIFont *font = [UIFont systemFontOfSize:15];
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    //choose some text
    NSString *text = @"我爱你哦～～～～我爱你哦～～～～我爱你哦～～～～我爱你哦～～～～我爱你哦～～～～。";
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    //set layer text
    textLayer.string = text;
}
- (UIView *)containerView{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.frame = CGRectMake(50, 100, 300, 400);
    }
    return _containerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
