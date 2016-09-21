//
//  XZRegularEngineViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZRegularEngineViewController.h"
#import <INTUAnimationEngine/INTUAnimationEngine.h>

@interface XZRegularEngineViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) INTUAnimationID animationID;

@end

@implementation XZRegularEngineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.label = [[UILabel alloc] initWithFrame:self.animationView.bounds];
    self.label.text = @"fsdf";
    self.label.numberOfLines = 0;
    self.label.textAlignment = NSTextAlignmentLeft;
    [self.animationView addSubview:self.label];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewAnimation{

    CGPoint startCenter = self.animationView.center;
    CGPoint endCenter = CGPointMake(self.animationView.center.x, self.animationView.center.y + 100);
    
    if (self.animationID) {
        
        NSLog(@"%ld",self.animationID);
        NSLog(@"%@",NSStringFromCGRect(self.animationView.frame));
        [INTUAnimationEngine cancelAnimationWithID:self.animationID];
        return;
    }
    
    self.animationID = [INTUAnimationEngine animateWithDuration:2
                                       delay:0
                                      easing:INTULinear
                                     options:INTUAnimationOptionRepeat |INTUAnimationOptionAutoreverse
                                  animations:^(CGFloat progress) {
        
                                      self.animationView.center = INTUInterpolateCGPoint(startCenter, endCenter, progress);
                                      
                                      self.animationView.layer.cornerRadius = INTUInterpolateCGFloat(0, 50, progress);
                                    
                                      self.animationView.transform = CGAffineTransformMakeRotation(INTUInterpolateCGFloat(0,M_PI_4,progress));
                                      
                                      self.animationView.backgroundColor = INTUInterpolateUIColor([UIColor redColor], [UIColor yellowColor], progress);
                                      
                                      self.label.textAlignment = [INTUInterpolateDiscreteValues(@[@(NSTextAlignmentLeft), @(NSTextAlignmentCenter), @(NSTextAlignmentRight)], progress) integerValue];
                                }
                                  completion:^(BOOL finished) {
        
                                      
                                      NSLog(@"Finish");
                                  }];
}
@end
