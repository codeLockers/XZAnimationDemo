//
//  XZUIViewAnimationViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZUIViewAnimationViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>
@interface XZUIViewAnimationViewController ()

@property (nonatomic, strong) UIView *animationView;

@end

@implementation XZUIViewAnimationViewController

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
    [self loadAnimationView];
    [self loadAnimationBtn];
}


- (void)loadAnimationView{

    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 100, 100)];
    self.animationView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.animationView];
}

- (void)loadAnimationBtn{

    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"animation" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(viewAniamtion) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    button.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(45);
}

#pragma mark - Private_Method
- (void)viewAniamtion{
    
    [UIView beginAnimations:@"animation1" context:nil];
    [UIView setAnimationDuration:5];
    
    self.animationView.center = self.view.center;
    
    self.animationView.transform = CGAffineTransformMakeScale(2, 2);
    
    [UIView commitAnimations];
    
//    [UIView beginAnimations:@"animation2" context:nil];
//    [UIView setAnimationDuration:0.5];
//    
//    self.animationView.transform = CGAffineTransformMakeTranslation(100, 100);
//    
//    [UIView commitAnimations];
}
@end
