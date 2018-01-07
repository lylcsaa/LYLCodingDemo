//
//  LYLNodeItem.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/3.
//  Copyright © 2018年 lyl. All rights reserved.
//
#import "LYLNode.h"
#import "LYLNodeItem.h"
static const CGFloat kNodeMarginLeft = 10.0f;
static const CGFloat kNodeLeftOffset = 15.0f;
static const CGFloat kNodeNameMarginLeft = 5.0f;
static const CGFloat kNodeButtonWidth = 40.0f;

static NSString *const kTopLevelNodeUnSelectedImageName = @"toplevel-n";
static NSString *const kTopLevelNodeSelectedImageName = @"toplevel-s";

static NSString *const kLowLevelNodeUnSelectedImageName = @"lowlevel-n";
static NSString *const kLowLevelNodeSelectedImageName = @"lowlevel-s";
@implementation LYLNodeItem

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self creatSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubviews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self creatSubviews];
    }
    return self;
}
-(void)creatSubviews
{
    UIButton *btn = [[UIButton alloc] init];
    
    [btn addTarget:self action:@selector(canOpenNode:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    _nodeButton = btn;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:label];
    _nodeNameLabel = label;
}
-(void)canOpenNode:(UIButton*)sender
{
    if (self.didClickNodeButton) {
        self.didClickNodeButton();
    }
}
-(void)setNode:(LYLNode *)node
{
    _node = node;
    _hasNextNode = node.subNodes.count > 0;
    _open = node.isOpen;
    _nodeLevel = node.node_level;
    _nodeNameLabel.text = node.nodeName;
//    [self layoutNodeItem];
    [self setNodeItems];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self layoutNodeItem];
}
-(void)layoutNodeItem{
    _nodeButton.frame = CGRectMake(kNodeMarginLeft + _nodeLevel*kNodeLeftOffset, (CGRectGetHeight(self.frame) - kNodeButtonWidth)*0.5, kNodeButtonWidth, kNodeButtonWidth);
    _nodeNameLabel.frame = CGRectMake(CGRectGetMaxX(_nodeButton.frame) + kNodeNameMarginLeft, 0, CGRectGetWidth(self.frame) - (CGRectGetMaxX(_nodeButton.frame) + kNodeNameMarginLeft), CGRectGetHeight(self.frame));
}
-(void)setNodeItems{
    _nodeButton.selected = _open;
    if (_hasNextNode) {
        [_nodeButton setImage:[UIImage imageNamed:kTopLevelNodeUnSelectedImageName] forState:UIControlStateNormal];
        [_nodeButton setImage:[UIImage imageNamed:kTopLevelNodeSelectedImageName] forState:UIControlStateSelected];
    }else{
        [_nodeButton setImage:[UIImage imageNamed:kLowLevelNodeUnSelectedImageName] forState:UIControlStateNormal];
        [_nodeButton setImage:[UIImage imageNamed:kLowLevelNodeSelectedImageName] forState:UIControlStateSelected];
    }
    [_nodeButton setContentMode:UIViewContentModeScaleAspectFit];
}
@end
