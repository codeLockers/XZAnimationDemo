//
//  XZAttachmentViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/21.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZAttachmentViewController.h"

@interface XZAttachmentViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation XZAttachmentViewController

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

    UIAttachmentBehavior * attachBeahavior =  [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToAnchor:self.view.center];
    attachBeahavior.length = 50;
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.animationView]];

    [self.animator addBehavior:attachBeahavior];
    [self.animator addBehavior:gravityBehavior];
    
    
}
@end
