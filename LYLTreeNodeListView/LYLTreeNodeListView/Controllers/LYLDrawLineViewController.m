//
//  LYLDrawLineViewController.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/7.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLDrawLineViewController.h"
#import "LYLDrawView.h"
@interface LYLDrawLineViewController ()

@end

@implementation LYLDrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    LYLDrawView *dview = [[LYLDrawView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:dview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
