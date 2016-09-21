//
//  XZPopPropertyViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPopPropertyViewController.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import <pop/POP.h>

@interface XZPopPropertyViewController ()
@property (nonatomic, strong) UILabel *timeLab;
@end

@implementation XZPopPropertyViewController

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
    [self loadTimeLab];
    [self loadAnimationBtn];
}

- (void)loadTimeLab{

    self.timeLab = [[UILabel alloc] init];
    self.timeLab.text = @"00:00:00";
    self.timeLab.textColor = [UIColor blackColor];
    
    [self.view addSubview:self.timeLab];
    
    self.timeLab.sd_layout
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view)
    .heightIs(30)
    .widthIs(100);
}

- (void)loadAnimationBtn{

    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Animation" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(propertyAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    button.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(45);
}

#pragma mark - Private_Methods
//readBlock告诉POP当前的属性值
//writeBlock中修改变化后的属性值
//threashold决定了动画变化间隔的阈值 值越大writeBlock的调用次数越少


- (void)propertyAnimation{

    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"prop" initializer:^(POPMutableAnimatableProperty *prop) {
       
        prop.readBlock = ^(id obj, CGFloat values[]){
        
//            NSLog(@"read = %f",values[0]);
        };
        prop.writeBlock = ^(id obj, const CGFloat values[]){
        
            UILabel *label = (UILabel *)obj;
            label.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
//            NSLog(@"write = %f",values[0]);
        };
        prop.threshold = 0.1;
    }];
    
    POPBasicAnimation *animation = [POPBasicAnimation linearAnimation];
    animation.property = prop;
    animation.fromValue = @(0);
    animation.toValue = @(18);
    animation.duration = 18;
    
    [self.timeLab pop_addAnimation:animation forKey:@"animation"];
    
//    POPAnimationTracer *tracer = animation.tracer;
//    tracer.shouldLogAndResetOnCompletion = YES;
//    [tracer start];
}
@end
