//
//  XZFLAnimatedImageViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZFLAnimatedImageViewController.h"
#import <FLAnimatedImage/FLAnimatedImage.h>

@interface XZFLAnimatedImageViewController ()

@property (nonatomic, strong) FLAnimatedImageView *imageView;

@end

@implementation XZFLAnimatedImageViewController

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
    
    [self loadImageView];
}

- (void)loadImageView{

    self.imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imageView.center = self.view.center;
    
    FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"]]];
    
    self.imageView.animatedImage = image;
    self.imageView.loopCompletionBlock = ^(NSUInteger loopCountRemaining){
        
        NSLog(@"Complete");
    };
    
    [self.view addSubview:self.imageView];
}
@end
