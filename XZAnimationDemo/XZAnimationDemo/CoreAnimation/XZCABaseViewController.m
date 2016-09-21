//
//  XZCABaseViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCABaseViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface XZCABaseViewController ()

@end

@implementation XZCABaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - load_UI
- (void)loadUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadAnimationView];
    [self loadAnimationBtn];
}

- (void)loadAnimationView{
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.animationView.center = self.view.center;
    self.animationView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.animationView];
}

- (void)loadAnimationBtn{
    
    self.animationBtn = [[UIButton alloc] init];
    self.animationBtn.backgroundColor = [UIColor blueColor];
    [self.animationBtn setTitle:@"Animation" forState:UIControlStateNormal];
    [self.animationBtn addTarget:self action:@selector(viewAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.animationBtn];
    
    self.animationBtn.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(45);
}

#pragma mark - Private_Methods=
- (void)viewAnimation{
    
    
}

@end
