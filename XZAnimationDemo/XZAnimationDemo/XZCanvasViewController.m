//
//  XZCanvasViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZCanvasViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import <Canvas/Canvas.h>

@interface XZCanvasViewController ()

@property (nonatomic, strong) CSAnimationView *animationView;

@end

@implementation XZCanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUI{

    [self loadAnimationView];
    [self loadAniamtionBtn];
}

- (void)loadAnimationView{

    self.animationView = [[CSAnimationView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
    self.animationView.backgroundColor = [UIColor greenColor];
    
    self.animationView.duration = 1.0f;
    self.animationView.delay = 0;
    self.animationView.type = CSAnimationTypeFlash;
    
    [self.view addSubview:self.animationView];
    
    
}

- (void)loadAniamtionBtn{

    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Animation" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(viewAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    button.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(45);
}

- (void)viewAnimation{

    [self.animationView startCanvasAnimation];
}

@end
