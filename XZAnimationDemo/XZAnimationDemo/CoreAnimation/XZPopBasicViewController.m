//
//  XZPopBasicViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPopBasicViewController.h"
#import <pop/POP.h>

@interface XZPopBasicViewController ()

@end

@implementation XZPopBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    POPBasicAnimation *animation = [POPBasicAnimation defaultAnimation];
    animation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPosition];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    animation.duration = 2;
    //delay
    //animation.beginTime = CACurrentMediaTime() + 1;
    animation.completionBlock = ^(POPAnimation *anim, BOOL finished){
    
        NSLog(@"%@",[NSDate date]);
    };
    [self.animationView.layer pop_addAnimation:animation forKey:@"animation"];
}

@end
