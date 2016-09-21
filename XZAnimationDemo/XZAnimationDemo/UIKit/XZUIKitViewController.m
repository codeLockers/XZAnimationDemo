//
//  XZUIKitViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/18.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZUIKitViewController.h"
#import "XZAnimationBlockViewController.h"
#import "XZKeyframeAnimaitonViewController.h"
#import "XZUIViewAnimationViewController.h"

@interface XZUIKitViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *_titleArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XZUIKitViewController

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

#pragma mark - load_UI
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
    
    _titleArray = @[@"UIView(UIViewAnimationWithBlocks)",@"UIView(UIViewKeyframeAnimations)",@"UIView(UIViewAnimation)"];
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
            XZAnimationBlockViewController *animationBlockVc = [[XZAnimationBlockViewController alloc] init];
            animationBlockVc.navigationItem.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:animationBlockVc animated:YES];
        }
            break;
        case 1:
        {
        
            XZKeyframeAnimaitonViewController *keyframeAniamtionVc = [[XZKeyframeAnimaitonViewController alloc] init];
            keyframeAniamtionVc.navigationItem.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:keyframeAniamtionVc animated:YES];
        }
            break;
        case 2:
        {
            XZUIViewAnimationViewController *uiViewAniamtionVc = [[XZUIViewAnimationViewController alloc] init];
            uiViewAniamtionVc.title = _titleArray[indexPath.row];
            [self.navigationController pushViewController:uiViewAniamtionVc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
