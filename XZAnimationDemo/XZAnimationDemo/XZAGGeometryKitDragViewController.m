//
//  XZAGGeometryKitDragViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZAGGeometryKitDragViewController.h"
#import <AGGeometryKit+POP/POPAnimatableProperty+AGGeometryKit.h>
#import <AGGeometryKit/AGGeometryKit.h>

@interface XZAGGeometryKitDragViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIView *topLeftControlView;
@property (nonatomic, strong) UIView *topRightControlView;
@property (nonatomic, strong) UIView *bottomLeftControlView;
@property (nonatomic, strong) UIView *bottomRightControlView;

@end

@implementation XZAGGeometryKitDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUI];
    
    [self addGesture];
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
    [self loadControlView];
}


- (void)loadImageView{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample_image" ofType:@"jpg"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300.0f, (image.size.height/image.size.width)*300.0f)];
    self.imageView.image = image;
    self.imageView.center = self.view.center;
    self.imageView.backgroundColor = [UIColor redColor];
    
    [self.imageView.layer ensureAnchorPointIs:CGPointZero];
    
    self.imageView.layer.quadrilateral = AGKQuadMake(self.topLeftControlView.center, self.topRightControlView.center, self.bottomRightControlView.center, self.bottomLeftControlView.center);
    
    
    [self.view addSubview:self.imageView];
}

- (void)loadControlView{

    self.topLeftControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.topLeftControlView.backgroundColor = [UIColor redColor];
    self.topLeftControlView.center = self.imageView.frame.origin;
    [self.view addSubview:self.topLeftControlView];
    
    self.topRightControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.topRightControlView.backgroundColor = [UIColor greenColor];
    self.topRightControlView.center = CGPointMake(self.imageView.frame.origin.x + self.imageView.frame.size.width, self.imageView.frame.origin.y);
    [self.view addSubview:self.topRightControlView];
    
    self.bottomLeftControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.bottomLeftControlView.backgroundColor = [UIColor blueColor];
    self.bottomLeftControlView.center = CGPointMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y + self.imageView.frame.size.height);
    [self.view addSubview:self.bottomLeftControlView];
    
    self.bottomRightControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.bottomRightControlView.backgroundColor = [UIColor yellowColor];
    self.bottomRightControlView.center = CGPointMake(self.imageView.frame.origin.x + self.imageView.frame.size.width, self.imageView.frame.origin.y + self.imageView.frame.size.height);
    [self.view addSubview:self.bottomRightControlView];
}

#pragma mark - Private_Methods
- (void)addGesture{

    UIPanGestureRecognizer *topLeftPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(topLeftPan_Method:)];
    [self.topLeftControlView addGestureRecognizer:topLeftPan];
    
    UIPanGestureRecognizer *topRightPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(topRightPan_Method:)];
    [self.topRightControlView addGestureRecognizer:topRightPan];
    
    UIPanGestureRecognizer *bottomLeftPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(bottomLeftPan_Method:)];
    [self.bottomLeftControlView addGestureRecognizer:bottomLeftPan];
    
    UIPanGestureRecognizer *bottomRightPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(bottomRightPan_Method:)];
    [self.bottomRightControlView addGestureRecognizer:bottomRightPan];
}

- (void)topLeftPan_Method:(UIPanGestureRecognizer *)pan{

    [self panGestureChanged:pan propertyName:kPOPLayerAGKQuadTopLeft];
}

- (void)topRightPan_Method:(UIPanGestureRecognizer *)pan{
    
     [self panGestureChanged:pan propertyName:kPOPLayerAGKQuadTopRight];
}

- (void)bottomLeftPan_Method:(UIPanGestureRecognizer *)pan{
    
     [self panGestureChanged:pan propertyName:kPOPLayerAGKQuadBottomLeft];
}

- (void)bottomRightPan_Method:(UIPanGestureRecognizer *)pan{
    
     [self panGestureChanged:pan propertyName:kPOPLayerAGKQuadBottomRight];
}

- (void)panGestureChanged:(UIPanGestureRecognizer *)recognizer propertyName:(NSString *)propertyName
{
    UIView *controlPointView = (UIView *)[recognizer view];
    CGPoint translation = [recognizer translationInView:self.view];
    
    // Move control point
    controlPointView.centerX += translation.x;
    controlPointView.centerY += translation.y;
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    // Animate
    POPSpringAnimation *anim = [self.imageView.layer pop_animationForKey:propertyName];
    
    if(anim == nil)
    {
        anim = [POPSpringAnimation animation];
        anim.property = [POPAnimatableProperty AGKPropertyWithName:propertyName];
        [self.imageView.layer pop_addAnimation:anim forKey:propertyName];
    }
    
    anim.velocity = [NSValue valueWithCGPoint:[recognizer velocityInView:self.view]];
    anim.toValue = [NSValue valueWithCGPoint:controlPointView.center];
    anim.springBounciness = 1;
    anim.springSpeed = 7;
    anim.dynamicsFriction = 7;
}


@end
