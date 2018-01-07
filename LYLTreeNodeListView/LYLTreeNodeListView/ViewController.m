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
    _items = @[@"LYLTreeViewController",@"LYLDrawLineViewController"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _items[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Class class = NSClassFromString(_items[indexPath.row]);
    UIViewController * viewController = (UIViewController*)class_createInstance(class, sizeof(class));
    viewController.navigationItem.title = _items[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end
