//
//  XZCABasicViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCABasicViewController.h"

@interface XZCABasicViewController ()

@end

@implementation XZCABasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1.0;
    animation.fromValue = @1;
    animation.toValue = @(2.0);
    
    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    animation1.duration = 1.0;
//    animation1.fromValue = @0;
//    animation1.toValue = @(200.0);
//    
    [self.animationView.layer addAnimation:animation forKey:@"animation"];
//    [self.animationView.layer addAnimation:animation1 forKey:@"animation1"];
}

@end
