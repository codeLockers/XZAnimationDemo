//
//  XZAnimationBlockViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/18.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZAnimationBlockViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface XZAnimationBlockViewController ()

@property (nonatomic, strong) UIButton *basicAnimationBtn;
@property (nonatomic, strong) UIButton *springAnimationBtn;
@property (nonatomic, strong) UIButton *transitionAnimationBtn1;
@property (nonatomic, strong) UIButton *transitionAnimationBtn2;

@property (nonatomic, strong) UIView *animationView1;
@property (nonatomic, strong) UIView *animationView2;

@end

@implementation XZAnimationBlockViewController

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
    [self loadAniamtionView1];
    [self loadBasicAniamtionBtn];
    [self loadSpringAniamtionBtn];
    [self loadTransitionAnimationBtn1];
    [self loadTransitionAnimationBtn2];
}

- (void)loadAniamtionView1{

    self.animationView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 100, 100)];
    self.animationView1.backgroundColor = [UIColor redColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view.backgroundColor = [UIColor greenColor];
    [self.animationView1 addSubview:view];
    
    [self.view addSubview:self.animationView1];
}

- (void)loadBasicAniamtionBtn{
    
    self.basicAnimationBtn = [[UIButton alloc] init];
    self.basicAnimationBtn.backgroundColor = [UIColor blueColor];
    [self.basicAnimationBtn setTitle:@"Basic Animation" forState:UIControlStateNormal];
    [self.basicAnimationBtn addTarget:self action:@selector(basicAniamtion) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.basicAnimationBtn];
    
    self.basicAnimationBtn.sd_layout
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(45);
}

- (void)loadSpringAniamtionBtn{

    self.springAnimationBtn = [[UIButton alloc] init];
    self.springAnimationBtn.backgroundColor = [UIColor blueColor];
    [self.springAnimationBtn setTitle:@"Spring Animation" forState:UIControlStateNormal];
    [self.springAnimationBtn addTarget:self action:@selector(springAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.springAnimationBtn];
    
    self.springAnimationBtn.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.basicAnimationBtn , 20)
    .heightRatioToView(self.basicAnimationBtn,1.0);
}

- (void)loadTransitionAnimationBtn1{

    self.transitionAnimationBtn1 = [[UIButton alloc] init];
    self.transitionAnimationBtn1.backgroundColor = [UIColor blueColor];
    [self.transitionAnimationBtn1 setTitle:@"Transition Animation1" forState:UIControlStateNormal];
    [self.transitionAnimationBtn1 addTarget:self action:@selector(transitionAniamtion1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.transitionAnimationBtn1];
    
    self.transitionAnimationBtn1.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.springAnimationBtn,20)
    .heightRatioToView(self.springAnimationBtn,1);
}

- (void)loadTransitionAnimationBtn2{

    self.transitionAnimationBtn2 = [[UIButton alloc] init];
    self.transitionAnimationBtn2.backgroundColor = [UIColor blueColor];
    [self.transitionAnimationBtn2 setTitle:@"Transition Animation2" forState:UIControlStateNormal];
    [self.transitionAnimationBtn2 addTarget:self action:@selector(transitionAniamtion2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.transitionAnimationBtn2];
    
    self.transitionAnimationBtn2.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.transitionAnimationBtn1,20)
    .heightRatioToView(self.transitionAnimationBtn1, 1.0);
}

#pragma mark - Setter && Getter
- (UIView *)animationView2{

    if (!_animationView2) {
        
        _animationView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _animationView2.backgroundColor = [UIColor yellowColor];
        
        [self.view addSubview:_animationView2];
    }
    return _animationView2;
}

#pragma mark - Private_Methods
- (void)basicAniamtion{

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.animationView1.transform = CGAffineTransformMakeTranslation(0, 200);
        
    } completion:^(BOOL finished) {

    }];
}

- (void)springAnimation{

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:30 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.animationView1.transform = CGAffineTransformMakeTranslation(0, 200);
        
    } completion:^(BOOL finished) {

    }];
}

- (void)transitionAniamtion1{

    [UIView transitionWithView:self.animationView1 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)transitionAniamtion2{
    
    [UIView transitionFromView:self.animationView1 toView:self.animationView2 duration:0.5 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {

    }];
}
@end
