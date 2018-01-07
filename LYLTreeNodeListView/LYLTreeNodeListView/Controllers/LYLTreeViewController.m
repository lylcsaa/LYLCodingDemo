//
//  LYLTreeViewController.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/7.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLTreeViewController.h"
#import "LYLTreeListView.h"
@interface LYLTreeViewController ()

@end

@implementation LYLTreeViewController
{
    LYLTreeListView*_tree;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTreeView];
    [self getMyTestNodeDatas];
    
}
-(void)initTreeView{
    _tree = [[LYLTreeListView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tree];
}
-(void)getMyTestNodeDatas{
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"testJsonData" ofType:@"json"]];
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@">>>>>>>%@",object);
    NSArray *nodes = object[@"nodes"];
    [_tree loadDatas:nodes hasSelectAllNode:YES];
}

@end
