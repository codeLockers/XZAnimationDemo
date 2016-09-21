//
//  XZCAGroupViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCAGroupViewController.h"

@interface XZCAGroupViewController ()

@end

@implementation XZCAGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{
    
    CGPoint start = CGPointMake(0, 150);
    CGPoint end = CGPointMake(100, 300);
    
    //初始化抛物线
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat cpx = (start.x + end.x)/2;
    CGFloat cpy = -50;
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, end.x, end.y);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.1];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 3.0;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.animations = @[animation,scaleAnimation];
    [self.animationView.layer addAnimation:groupAnimation forKey:@"position scale"];
}

@end
