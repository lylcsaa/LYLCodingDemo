//
//  LYLNodeItem.h
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYLNode;
@interface LYLNodeItem : UITableViewCell
@property(nonatomic,strong,readonly)UIButton *nodeButton;
@property(nonatomic,strong,readonly)UILabel *nodeNameLabel;
@property(nonatomic,assign)NSInteger nodeLevel;
@property(nonatomic,assign)NSInteger hasNextNode;
@property(nonatomic,assign,getter=isOpen)BOOL open;
@property(nonatomic,copy)void (^didClickNodeButton)(void);
@property(nonatomic,strong)LYLNode *node;
@end
