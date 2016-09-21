//
//  XZDisplayLinkViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/21.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZDisplayLinkViewController.h"

@interface XZDisplayLinkViewController ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation XZDisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(viewAnimation)];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    self.displayLink.paused = YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    self.displayLink.paused = NO;

    self.animationView.frame = CGRectMake(CGRectGetMinX(self.animationView.frame)+0.2, CGRectGetMinY(self.animationView.frame), CGRectGetWidth(self.animationView.frame), CGRectGetHeight(self.animationView.frame));
    
}


@end
