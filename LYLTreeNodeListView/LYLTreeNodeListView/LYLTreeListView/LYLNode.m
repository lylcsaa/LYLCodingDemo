//
//  LYLNode.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLNode.h"

@implementation LYLNode{
    NSMutableArray *_array;
}
-(void)addSubNodes:(NSArray *)objects  hasSelectAllNode:(BOOL)hasAllNode{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    NSMutableArray *arr = [NSMutableArray array];
    BOOL isInsert = NO;
    for (NSDictionary *node in objects) {
        NSArray *subNodes = node[@"subnodes"];
        int nodeLevel = [node[@"node_level"] intValue];
        if (subNodes.count == 0 && hasAllNode &&!isInsert) {
            LYLNode *allnode =  [[LYLNode alloc] init];
            allnode.nodeName = @"全选";
            allnode.node_level = nodeLevel;
            isInsert = YES;
            allnode.subNodes = @[];
            allnode.isSelectAllNode = YES;
            allnode.supNode = self;
            [arr addObject:allnode];
        }
        LYLNode *nodeObject = [[LYLNode alloc] init];
        nodeObject.nodeName = node[@"name"];
        nodeObject.node_level = nodeLevel;
        nodeObject.supNode = self;
//        NSArray *subNodes = node[@"subnodes"];
        if ([subNodes count] > 0) {
            [nodeObject addSubNodes:subNodes hasSelectAllNode:hasAllNode];
        }
        
        [arr addObject:nodeObject];
    }
    [_array addObjectsFromArray:arr];
    _subNodes = [_array copy];
}
-(NSString *)description{
    return [NSString stringWithFormat:@"<LYLNode:%p>,_nodeName=%@,_subNodes=%@",self,_nodeName, _subNodes];
}
@end
