//
//  LYLTreeListView.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLTreeListView.h"
#import "LYLNodeItem.h"
static NSString *const reuseId = @"reuse-cell";
@interface LYLTreeListView()<UITableViewDelegate,UITableViewDataSource,LYLNodeDataSourceDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end
@implementation LYLTreeListView
-(void)loadDatas:(NSArray*)datas hasSelectAllNode:(BOOL)hasSelectAllNode{
    [self.dataSource parserData:datas hasSelectAllNode:hasSelectAllNode];
}
-(NSArray *)selectedNodes{
    return self.dataSource.selectedNodes;
}
-(LYLNodeDataSource *)dataSource{
    if (!_dataSource) {
        _dataSource = [[LYLNodeDataSource alloc] init];
        _dataSource.delegate = self;
    }
    return _dataSource;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}
-(void)nodeDataShouldAready:(LYLNodeDataSource *)nodeData shouldReloadData:(BOOL)s{
    [self.tableView reloadData];
}
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldAddFromIndex:(int)index addCount:(int)count{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index + i inSection:0];
        [indexPaths addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
}
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldRemoveFromIndex:(int)index removeCount:(int)count{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index + i inSection:0];
        [indexPaths addObject:indexPath];
    }
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
}
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldReloadFromIndex:(int)index relaodCount:(int)count{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index + i inSection:0];
        [indexPaths addObject:indexPath];
    }
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.dataSource.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYLNodeItem *item = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!item) {
        item = [[LYLNodeItem alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    __block LYLTreeListView*weakSelf = self;
    LYLNode *node = self.dataSource.dataSource[indexPath.row];
    item.node = node;
    item.didClickNodeButton = ^{
        [weakSelf tableView:tableView didSelectRowAtIndexPath:indexPath];
    };
    return item;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     LYLNode *node = self.dataSource.dataSource[indexPath.row];
     node.isOpen = !node.isOpen;
    [_dataSource openNode:node atIndex:(int)indexPath.row];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    NSLog(@">>>>>>selectedNodes:%@",_dataSource.selectedNodes);
}
@end
