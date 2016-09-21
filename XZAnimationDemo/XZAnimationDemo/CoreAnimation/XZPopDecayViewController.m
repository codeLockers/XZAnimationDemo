//
//  XZPopDecayViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPopDecayViewController.h"
#import <pop/POP.h>

@interface XZPopDecayViewController ()

@end

@implementation XZPopDecayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animation.velocity = @(-250);
    
    [self.animationView pop_addAnimation:animation forKey:@"animation"];
}

@end
