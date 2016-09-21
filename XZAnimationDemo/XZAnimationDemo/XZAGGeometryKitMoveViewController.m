//
//  XZAGGeometryKitMoveViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZAGGeometryKitMoveViewController.h"
#import <AGGeometryKit+POP/POPAnimatableProperty+AGGeometryKit.h>
#import <AGGeometryKit/AGGeometryKit.h>
#import <SDAutoLayout/SDAutoLayout.h>

@interface XZAGGeometryKitMoveViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) AGKQuad desiredQuad;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@end

@implementation XZAGGeometryKitMoveViewController

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
    [self loadSegementControl];
}


- (void)loadImageView{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample_image" ofType:@"jpg"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, (image.size.height/image.size.width)*200.0f)];
    self.imageView.image = image;
    self.imageView.center = self.view.center;
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.userInteractionEnabled = YES;
    
    [self.imageView.layer ensureAnchorPointIs:CGPointZero];
    
    [self.view addSubview:self.imageView];
    
    self.desiredQuad = self.imageView.layer.quadrilateral;
}

- (void)loadSegementControl{

    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"Fast",@"Bouncy",@"Subtle"]];
    self.segmentControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segmentControl];

    self.segmentControl.sd_layout
    .topSpaceToView(self.view,80)
    .centerXEqualToView(self.view);
}

#pragma mark - Private_Methods
- (void)addGesture{

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureChanged:)];
    
    [self.imageView addGestureRecognizer:pan];
}

- (CGFloat)longestDistanceOfPointsInQuad:(AGKQuad)quad toPoint:(CGPoint)point
{
    CGFloat longestDistanceFromTouch = 0.0;
    
    for(int cornerIndex = 0; cornerIndex < 4; cornerIndex++)
    {
        CGPoint currentCornerPoint = AGKQuadGet(quad,cornerIndex);
        CGFloat distance = fabs(CGPointLengthBetween_AGK(point, currentCornerPoint));
        
        if(distance > longestDistanceFromTouch)
        {
            longestDistanceFromTouch = distance;
        }
    }
    return longestDistanceFromTouch;
}

- (void)panGestureChanged:(UIPanGestureRecognizer *)recognizer
{
    switch (self.segmentControl.selectedSegmentIndex)
    {
        case 0:
            [self panGestureChanged:recognizer animationTuning:^(POPSpringAnimation *anim, int cornerIndex, CGFloat dragCoefficient) {
                anim.dynamicsMass       = 1;
                anim.dynamicsFriction   = 37;
                anim.dynamicsTension    = 2;
                anim.springBounciness   = AGKInterpolate(4, 12, dragCoefficient);
                anim.springSpeed        = AGKInterpolate(10, 50, dragCoefficient);
            }];
            break;
        case 1:
            [self panGestureChanged:recognizer animationTuning:^(POPSpringAnimation *anim, int cornerIndex, CGFloat dragCoefficient) {
                anim.dynamicsMass       = 100;
                anim.dynamicsFriction   = 37;
                anim.dynamicsTension    = 2;
                anim.springBounciness   = AGKInterpolate(10, 20, dragCoefficient);
                anim.springSpeed        = AGKInterpolate(10, 20, dragCoefficient);
            }];
            break;
        case 2:
        default:
            [self panGestureChanged:recognizer animationTuning:^(POPSpringAnimation *anim, int cornerIndex, CGFloat dragCoefficient) {
                anim.dynamicsMass       = 100;
                anim.dynamicsFriction   = 37;
                anim.dynamicsTension    = 2;
                anim.springBounciness   = AGKInterpolate(5, 12, dragCoefficient);
                anim.springSpeed        = AGKInterpolate(4, 7, dragCoefficient);
            }];
            break;
    }
}

- (void)panGestureChanged:(UIPanGestureRecognizer *)recognizer animationTuning:(void(^)(POPSpringAnimation *anim, int cornerIndex, CGFloat dragCoefficient))tuning
{
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint pointOfTouchInside = [recognizer locationInView:recognizer.view];
    self.desiredQuad = AGKQuadMove(self.desiredQuad, translation.x, translation.y);
    AGKQuad innerQuad = [recognizer.view.layer.superlayer convertAGKQuad:self.desiredQuad toLayer:recognizer.view.layer];
    NSArray *cornersForProperties = @[kPOPLayerAGKQuadTopLeft, kPOPLayerAGKQuadTopRight, kPOPLayerAGKQuadBottomRight, kPOPLayerAGKQuadBottomLeft];
    CGFloat longestDistanceFromTouch = [self longestDistanceOfPointsInQuad:innerQuad toPoint:pointOfTouchInside];
    
    for(int cornerIndex = 0; cornerIndex < 4; cornerIndex++)
    {
        NSString *propertyName = cornersForProperties[cornerIndex];
        
        POPSpringAnimation *anim = [self.imageView.layer pop_animationForKey:propertyName];
        if(anim == nil)
        {
            anim = [POPSpringAnimation animation];
            anim.property = [POPAnimatableProperty AGKPropertyWithName:propertyName];
            [self.imageView.layer pop_addAnimation:anim forKey:propertyName];
        }
        
        CGPoint currentCornerPoint = AGKQuadGet(innerQuad,cornerIndex);
        CGFloat distance = fabs(CGPointLengthBetween_AGK(pointOfTouchInside, currentCornerPoint));
        CGFloat dragCoefficient = AGKRemapToZeroOne(distance, longestDistanceFromTouch, 0);
        
        anim.toValue = [NSValue valueWithCGPoint:AGKQuadGet(self.desiredQuad, cornerIndex)];
        tuning(anim, cornerIndex, dragCoefficient);
    }
    
    [recognizer setTranslation:CGPointZero inView:self.view];
}


@end
