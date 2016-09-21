//
//  XZCABaseViewController.h
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/19.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZCABaseViewController : UIViewController
@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) UIButton *animationBtn;
- (void)viewAnimation;
@end
