//
//  XZSpringEngineViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZSpringEngineViewController.h"
#import <INTUAnimationEngine/INTUAnimationEngine.h>

@interface XZSpringEngineViewController ()

@end

@implementation XZSpringEngineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    CGPoint moveStart = self.animationView.center;
    CGPoint moveEnd = CGPointMake(moveStart.x + 100, moveStart.y);
    
    [INTUAnimationEngine animateWithDamping:15
                                  stiffness:250
                                       mass:5
                                      delay:0 animations:^(CGFloat progress) {
        
                                          NSLog(@"%f",progress);
                                          self.animationView.center = INTUInterpolateCGPoint(moveStart, moveEnd, progress);
                                    }
                                 completion:^(BOOL finished) {
        
                                     NSLog(@"Finish");
                                 }];
}

@end
