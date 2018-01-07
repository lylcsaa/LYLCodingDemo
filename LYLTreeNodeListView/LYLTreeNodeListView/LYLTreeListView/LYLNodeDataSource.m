//
//  LYLNodeDataSource.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLNodeDataSource.h"
#import "LYLNode.h"
@implementation LYLNodeDataSource
{
    NSMutableArray *_array;
    NSMutableArray *_selectedArray;
}
-(NSInteger)rowCount{
    return self.dataSource.count;
}
-(NSArray *)selectedNodes{
    return [_selectedArray copy];
}
-(void)parserData:(NSArray *)nodes hasSelectAllNode:(BOOL)hasSelectAllNode{
    NSMutableArray *nodeDatas = [NSMutableArray array];
    for (NSDictionary *node in nodes) {
        LYLNode *nodeObject = [[LYLNode alloc] init];
        nodeObject.nodeName = node[@"name"];
        nodeObject.node_level = [node[@"node_level"] intValue];
        NSArray *subNodes = node[@"subnodes"];
        if ([subNodes count] > 0) {
            [nodeObject addSubNodes:subNodes hasSelectAllNode:hasSelectAllNode];
        }
        [nodeDatas addObject:nodeObject];
    }
    [self initNodeDatas:nodeDatas];
}
-(void)initNodeDatas:(NSArray *)nodeDatas{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    [_array addObjectsFromArray:nodeDatas];
    _dataSource = [_array copy];
    [_delegate nodeDataShouldAready:self shouldReloadData:YES];
}
-(void)openNode:(LYLNode*)node atIndex:(int)index{
    if (!_selectedArray) {
        _selectedArray = [NSMutableArray array];
    }
    NSMutableArray *newArr = [NSMutableArray array];
    [newArr addObjectsFromArray:_dataSource];
    if (node.isOpen) {
        if (node.subNodes.count > 0) {
            [newArr insertObjects:node.subNodes atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index + 1, node.subNodes.count)]];
            _dataSource = [newArr copy];
            [_delegate nodeDataShouldAready:self shouldAddFromIndex:index + 1 addCount:(int)node.subNodes.count];
        }else{
            if (!node.isSelectAllNode && ![_selectedArray containsObject:node]) {
                [_selectedArray addObject:node];
                LYLNode *superNode = node.supNode;
                int count = (int)superNode.subNodes.count;
                int tmp = 0;
                for (LYLNode *subNode in superNode.subNodes) {
                    if (!subNode.isSelectAllNode && subNode.isOpen) {
                        tmp += 1;
                    }
                }
                if (count - 1 == tmp) {
                    LYLNode *allNode = superNode.subNodes.firstObject;
                    if (allNode.isSelectAllNode) {
                        allNode.isOpen = node.isOpen;
                    }
                }
                 NSInteger len = [superNode.subNodes indexOfObject:node];
                [_delegate nodeDataShouldAready:self shouldReloadFromIndex:index-(int)len relaodCount:(int)superNode.subNodes.count];
            }else{
                LYLNode *superNode = node.supNode;
                for (LYLNode *subNode in superNode.subNodes) {
                    if (![subNode isEqual:node]) {
                        subNode.isOpen = node.isOpen;
                        if (![_selectedArray containsObject:subNode]) {
                            [_selectedArray addObject:subNode];
                        }
                    }
                }
                [_delegate nodeDataShouldAready:self shouldReloadFromIndex:index + 1 relaodCount:(int)superNode.subNodes.count];
            }
        }
        
    }else{
        
        if (node.subNodes.count > 0) {
            int len = 0;
            for (int i = (int)index + 1; i < newArr.count; i++) {
                LYLNode *n = newArr[i];
                if (n.node_level <= node.node_level) {
                    break;
                }
                if (n.subNodes.count != 0) {
                    n.isOpen = NO;
                }
                len += 1;
            }
            [newArr removeObjectsInRange:NSMakeRange(index + 1, len)];
            _dataSource = [newArr copy];
            [_delegate nodeDataShouldAready:self shouldRemoveFromIndex:index + 1 removeCount:len];
        }else{
            if (node.isSelectAllNode) {
                LYLNode *superNode = node.supNode;
                for (LYLNode *subNode in superNode.subNodes) {
                    if (![superNode isEqual:node]) {
                        subNode.isOpen = node.isOpen;
                        if ([_selectedArray containsObject:subNode]) {
                            [_selectedArray removeObject:subNode];
                        }
                    }
                }
                [_delegate nodeDataShouldAready:self shouldReloadFromIndex:index + 1 relaodCount:(int)superNode.subNodes.count];
            }else{
                LYLNode *superNode = node.supNode;
                NSArray *subNodes = superNode.subNodes;
                NSInteger len = [subNodes indexOfObject:node];
                LYLNode *allNode = subNodes.firstObject;
                if (allNode.isSelectAllNode) {
                    allNode.isOpen = node.isOpen;
                }
                if ([_selectedArray containsObject:node]) {
                    [_selectedArray removeObject:node];
                }
                [_delegate nodeDataShouldAready:self shouldReloadFromIndex:index - (int)len relaodCount:(int)superNode.subNodes.count];
            }
        }
    }
}

@end
