//
//  XZGravityViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZGravityViewController.h"


@interface XZGravityViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;


@end

@implementation XZGravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] init];
    
    self.animationView.frame = CGRectMake(CGRectGetMinX(self.animationView.frame), 70, CGRectGetWidth(self.animationView.frame), CGRectGetHeight(self.animationView.frame));
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] init];
    
    [behavior addItem:self.animationView];
    
//    behavior.gravityDirection = CGVectorMake(0.5, 0.5);
//    behavior.angle = M_PI_4;
    behavior.magnitude = 3;
    
    [self.animator addBehavior:behavior];
}

@end
