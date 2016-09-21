//
//  XZCASpringViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCASpringViewController.h"

@interface XZCASpringViewController ()

@end

@implementation XZCASpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.toValue = @2.0;

    animation.duration = 3.0f;
    animation.mass = 10.0f;
    animation.stiffness = 100;
    animation.damping = 10.0f;
    animation.initialVelocity = 5.0f;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.animationView.layer addAnimation:animation forKey:@"animation"];
}

@end
