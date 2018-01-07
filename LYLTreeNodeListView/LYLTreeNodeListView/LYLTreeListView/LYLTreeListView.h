//
//  LYLTreeListView.h
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYLTreeListView;
#import "LYLNode.h"
#import "LYLNodeDataSource.h"
@interface LYLTreeListView : UIView
@property(nonatomic,strong)LYLNodeDataSource *dataSource;
@property(nonatomic,strong)NSArray*selectedNodes;
-(void)loadDatas:(NSArray*)datas hasSelectAllNode:(BOOL)hasSelectAllNode;
@end
