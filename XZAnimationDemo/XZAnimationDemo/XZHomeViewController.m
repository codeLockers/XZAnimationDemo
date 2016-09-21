//
//  XZHomeViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/18.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZHomeViewController.h"
#import "XZCoreAnimationViewController.h"
#import "XZUIKitViewController.h"
#import "XZPopViewController.h"
#import "XZCanvasViewController.h"
#import "XZAnimationEngineViewController.h"
#import "XZAGGeometryKitViewController.h"
#import "XZFLAnimatedImageViewController.h"
#import "XZDynamicViewController.h"
#import "XZDisplayLinkViewController.h"

@interface XZHomeViewController ()<UITableViewDelegate,UITableViewDataSource>{

    NSArray *_titleArray;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
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
    [self loadTableView];
}

- (void)loadTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Load_Data
- (void)loadData{

    _titleArray = @[@"UIKit引擎",@"Core Animation引擎",@"Facebook POP引擎",@"Canvas",@"AnimationEngine",@"AGGeometryKit+Pop",@"XZFLAnimatedImage",@"UIDynamic",@"CADisplayLink"];
}

#pragma mark - UITableview_DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = _titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            XZUIKitViewController *uikitVc = [[XZUIKitViewController alloc] init];
            uikitVc.title = @"UIKit引擎";
            [self.navigationController pushViewController:uikitVc animated:YES];
        }
            break;
        case 1:
        {
            XZCoreAnimationViewController *coreAnimationVc = [[XZCoreAnimationViewController alloc] init];
            coreAnimationVc.title = @"系统Core Animation引擎";
            [self.navigationController pushViewController:coreAnimationVc animated:YES];
        }
            break;
        case 2:
        {
            XZPopViewController *popVc = [[XZPopViewController alloc] init];
            popVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:popVc animated:YES];
        }
            break;
        case 3:
        {
            XZCanvasViewController *canvasVc = [[XZCanvasViewController alloc] initWithNibName:NSStringFromClass([XZCanvasViewController class]) bundle:[NSBundle mainBundle]];
            canvasVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:canvasVc animated:YES];
        }
            break;
        case 4:
        {
            XZAnimationEngineViewController *animationEngineVc = [[XZAnimationEngineViewController alloc] init];
            animationEngineVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:animationEngineVc animated:YES];
        }
            break;
        case 5:
        {
            XZAGGeometryKitViewController *aggeometryKitVc = [[XZAGGeometryKitViewController alloc] init];
            aggeometryKitVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:aggeometryKitVc animated:YES];
        }
            break;
        case 6:
        {
            XZFLAnimatedImageViewController *animatedImageVc = [[XZFLAnimatedImageViewController alloc] init];
            animatedImageVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:animatedImageVc animated:YES];
        }
            break;
        case 7:
        {
            XZDynamicViewController *dynamicVc = [[XZDynamicViewController alloc] init];
            dynamicVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:dynamicVc animated:YES];
        }
            break;
        case 8:
        {
            XZDisplayLinkViewController *displayLink = [[XZDisplayLinkViewController alloc] init];
            displayLink.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:displayLink animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
