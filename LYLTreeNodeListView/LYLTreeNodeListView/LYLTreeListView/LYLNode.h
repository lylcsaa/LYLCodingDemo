//
//  LYLNode.h
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYLNode : NSObject
@property(nonatomic,assign)int node_id;
@property(nonatomic,assign)int node_level;
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,assign)BOOL hasSubNode;
@property(nonatomic,assign)BOOL isSelectAllNode;
@property(nonatomic,copy)NSString *nodeName;
@property(nonatomic,strong)NSArray *subNodes;
@property(nonatomic,strong)LYLNode *supNode;
-(void)addSubNodes:(NSArray *)objects hasSelectAllNode:(BOOL)hasAllNode;
@end
