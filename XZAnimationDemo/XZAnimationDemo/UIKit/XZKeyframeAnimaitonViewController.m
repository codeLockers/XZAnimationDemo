//
//  XZKeyframeAnimaitonViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/18.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZKeyframeAnimaitonViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface XZKeyframeAnimaitonViewController ()

@property (nonatomic, strong) UIButton *keyfrmeAnimationBtn;

@property (nonatomic, strong) UIView *animationView;

@end

@implementation XZKeyframeAnimaitonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Load_UI
- (void)loadUI{

    self.view.backgroundColor = [UIColor whiteColor];
    [self loadAnimation];
    [self loadKeyframeAnimationBtn];
}

- (void)loadAnimation{

    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 100, 100)];
    self.animationView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.animationView];
    
}

- (void)loadKeyframeAnimationBtn{

    self.keyfrmeAnimationBtn = [[UIButton alloc] init];
    self.keyfrmeAnimationBtn.backgroundColor = [UIColor blueColor];
    [self.keyfrmeAnimationBtn setTitle:@"Keyframe Animation" forState:UIControlStateNormal];
    [self.keyfrmeAnimationBtn addTarget:self action:@selector(keyframeAnimation) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.keyfrmeAnimationBtn];
    
    self.keyfrmeAnimationBtn.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(45);
}

#pragma mark - Private_Methods
- (void)keyframeAnimation{

    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            
            self.animationView.center = CGPointMake(100, 100);
            
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            self.animationView.center = CGPointMake(150, 200);
            
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.2 animations:^{
            self.animationView.center = CGPointMake(200, 150);
            
        }];
        [UIView addKeyframeWithRelativeStartTime:0.7 relativeDuration:0.1 animations:^{
            self.animationView.center = CGPointMake(300, 250);
            
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            self.animationView.center = CGPointMake(200, 200);
            
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
