//
//  XZSnapViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/21.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZSnapViewController.h"

@interface XZSnapViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation XZSnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] init];
    
    self.animationView.frame = CGRectMake(10, 70, CGRectGetWidth(self.animationView.frame), CGRectGetHeight(self.animationView.frame));
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    UISnapBehavior *bahavior = [[UISnapBehavior alloc] initWithItem:self.animationView snapToPoint:self.view.center];
    bahavior.damping = 0.1;
    
    [self.animator addBehavior:bahavior];
    
}

@end
