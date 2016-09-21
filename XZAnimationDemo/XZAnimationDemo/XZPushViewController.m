//
//  XZPushViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/21.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPushViewController.h"

@interface XZPushViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation XZPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    UIPushBehavior *behavior = [[UIPushBehavior alloc] initWithItems:@[self.animationView] mode:UIPushBehaviorModeInstantaneous];
    
    behavior.magnitude = 1.0;
    UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.animationView]];
    itemBehavior.resistance = 0.8;
    [self.animator addBehavior:itemBehavior];

    [self.animator addBehavior:behavior];
}

@end
