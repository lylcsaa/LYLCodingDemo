//
//  LYLXRipple ViewController.m
//  LYLTreeNodeListView
//
//  Created by wlx on 2018/1/8.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLXRippleViewController.h"
#import "LYLXRippleView.h"
#import "LYLCloseMenu.h"
@interface LYLXRippleViewController ()

@end

@implementation LYLXRippleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    LYLXRippleView *view = [[LYLXRippleView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:view];
    LYLCloseMenu *menu = [[LYLCloseMenu alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:menu];
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
