//
//  ViewController.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//
#import <objc/runtime.h>
#import "ViewController.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *items;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _items = @[
  @{@"LYLTreeViewController":@"树形选择器"},
  @{@"LYLDrawLineViewController":@"绘制曲线"},
  @{@"LYLXRippleViewController":@"绘制水波纹动画"}];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [[(NSDictionary*)_items[indexPath.row] allValues] firstObject];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Class class = NSClassFromString([[(NSDictionary*)_items[indexPath.row] allKeys] firstObject]);
    UIViewController * viewController = (UIViewController*)class_createInstance(class, sizeof(class));
    viewController.navigationItem.title = [[(NSDictionary*)_items[indexPath.row] allValues] firstObject];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end
