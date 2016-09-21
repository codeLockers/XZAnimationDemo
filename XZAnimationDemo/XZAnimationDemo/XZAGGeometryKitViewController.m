//
//  XZAGGeometryKitViewController.m
//  XZAnimationDemo
//
//  Created by 徐章 on 16/9/20.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "XZAGGeometryKitViewController.h"
#import "XZAGGeometryKitDragViewController.h"
#import "XZAGGeometryKitMoveViewController.h"

@interface XZAGGeometryKitViewController ()<UITableViewDelegate,UITableViewDataSource>{

    NSArray *_titleArray;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XZAGGeometryKitViewController

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
    
    _titleArray = @[@"Drag",@"move"];
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
    
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
        {
            viewController = [[XZAGGeometryKitDragViewController alloc] init];
        }
            break;
        case 1:
        {
            viewController = [[XZAGGeometryKitMoveViewController alloc] init];
        }
            break;
        default:
            break;
    }
    
    viewController.title = _titleArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
