//
//  XZPopSpringViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZPopSpringViewController.h"
#import <pop/POP.h>

@interface XZPopSpringViewController ()

@end

@implementation XZPopSpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//注意:POPSpringAnimation是没有duration字段的 其动画持续时间由以上几个参数决定
//springBounciness:4.0    //[0-20] 弹力 越大则震动幅度越大
//springSpeed     :12.0   //[0-20] 速度 越大则动画结束越快
//dynamicsTension :0      //拉力  接下来这三个都跟物理力学模拟相关 数值调整起来也很费时 没事不建议使用哈
//dynamicsFriction:0      //摩擦 同上
//dynamicsMass    :0      //质量 同上
- (void)viewAnimation{

    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    animation.springSpeed = 5.0;
    animation.springBounciness = 10;
    [self.animationView pop_addAnimation:animation forKey:@"animation"];
}

@end
