//
//  XZCATransitonViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCATransitonViewController.h"

@interface XZCATransitonViewController ()
@end

@implementation XZCATransitonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private_Methods=
- (void)viewAnimation{
    
    self.animationView.backgroundColor = [UIColor greenColor];
    
    CATransition *transition = [CATransition animation];
    transition.subtype = kCATransitionFromRight;
    transition.type = kCAAnimationRotateAuto;
    transition.duration = 1.0f;
    
    [self.animationView.layer addAnimation:transition forKey:@"animation"];
}

@end
