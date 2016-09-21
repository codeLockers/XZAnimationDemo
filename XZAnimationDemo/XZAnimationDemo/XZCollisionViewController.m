//
//  XZCollisionViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCollisionViewController.h"

@interface XZCollisionViewController ()<UIDynamicAnimatorDelegate,UICollisionBehaviorDelegate>
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation XZCollisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.animator = [[UIDynamicAnimator alloc] init];
    self.animator.delegate = self;
    
    self.animationView.frame = CGRectMake(10, 70, CGRectGetWidth(self.animationView.frame), CGRectGetHeight(self.animationView.frame));
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    UIGravityBehavior *gravityBehavior1 = [[UIGravityBehavior alloc] init];
    [gravityBehavior1 addItem:self.animationView];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] init];
    [collisionBehavior addItem:self.animationView];
    
    [collisionBehavior addBoundaryWithIdentifier:@"button" forPath:[UIBezierPath bezierPathWithRect:self.animationBtn.frame]];
//    [collisionBehavior addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, 150) toPoint:CGPointMake(150, 300)];
    
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:gravityBehavior1];
}


- (void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator{

    NSLog(@"resume");
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator{

    NSLog(@"pause");
}
@end
