//
//  XZPopCustomViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPopCustomViewController.h"
#import <pop/POP.h>

@interface XZPopCustomViewController ()

@end

@implementation XZPopCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    POPCustomAnimation *animation1 = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {

        CGFloat offset = 20 * animation.elapsedTime;

        self.animationView.center = CGPointMake(self.animationView.center.x+offset, self.animationView.center.y);
        
        NSLog(@"%f - %@",offset,NSStringFromCGPoint(self.animationView.center));
        
        if (self.animationView.center.x >= 280) {
            return NO;
        }
        
        return YES;
    }];
    
    [self.animationView pop_addAnimation:animation1 forKey:@"animation"];
  
}

@end
