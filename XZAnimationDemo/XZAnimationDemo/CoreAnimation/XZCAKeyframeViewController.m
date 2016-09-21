//
//  XZCAKeyframeViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCAKeyframeViewController.h"

@interface XZCAKeyframeViewController ()

@end

@implementation XZCAKeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    /*
    animation.values = @[
                         [NSValue valueWithCGPoint:self.animationView.center],
                         [NSValue valueWithCGPoint:CGPointMake(200, 200)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 300)],
                         [NSValue valueWithCGPoint:CGPointMake(100, 50)],
                         [NSValue valueWithCGPoint:self.animationView.center],
                         ];
    animation.repeatCount = MAXFLOAT;
    
    animation.keyTimes = @[
                                  [NSNumber numberWithFloat:0.0],
                                  [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:0.7],
                                  [NSNumber numberWithFloat:0.8],
                                  [NSNumber numberWithFloat:1.0],
                                  ];
    //时间函数
    animation.timingFunctions = @[
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         ];
     */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.animationView.frame];
    
    animation.path = path.CGPath;

    animation.duration = 4.0f;
    
    [self.animationView.layer addAnimation:animation forKey:@"position"];
    
}

@end
