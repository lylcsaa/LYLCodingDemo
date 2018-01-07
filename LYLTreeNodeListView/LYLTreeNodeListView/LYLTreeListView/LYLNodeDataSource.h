//
//  LYLNodeDataSource.h
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LYLNodeDataSource;
@class LYLNode;
@protocol LYLNodeDataSourceDelegate
@optional
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldReloadData:(BOOL)s;
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldAddFromIndex:(int)index addCount:(int)count;
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldRemoveFromIndex:(int)index removeCount:(int)count;
-(void)nodeDataShouldAready:(LYLNodeDataSource*)nodeData shouldReloadFromIndex:(int)index relaodCount:(int)count;
@end
@interface LYLNodeDataSource : NSObject
@property(nonatomic,weak)id<LYLNodeDataSourceDelegate>delegate;

@property(nonatomic,strong)NSArray*dataSource;
@property(nonatomic,strong)NSArray*selectedNodes;
@property(nonatomic,assign)NSInteger rowCount;
-(void)initNodeDatas:(NSArray*)nodeDatas;
-(void)openNode:(LYLNode*)node atIndex:(int)index;
-(void)parserData:(NSArray*)data hasSelectAllNode:(BOOL)hasSelectAllNode;
@end
