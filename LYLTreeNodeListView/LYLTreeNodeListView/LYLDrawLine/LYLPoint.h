//
//  LYLPoint.h
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/7.
//  Copyright © 2018年 lyl. All rights reserved.
//

#ifndef LYLPoint_h
#define LYLPoint_h

#include <stdio.h>

/*
 
 |-----------------------------------------------------------|
 |                             x                             |
 |-----------------------------------------------------------|
 |                             y                             |
 |-----------------------------------------------------------|
 |rect_colot_r   |  rect_colot_g|rect_colot_b  | rect_colot_a|
 |-----------------------------------------------------------|
 |fill_colot_r   |  fill_colot_g|fill_colot_b  | fill_colot_a|
 |-----------------------------------------------------------|
 |rect_h         |topline_h     |bottomline_h  |rect_width   |
 |-----------------------------------------------------------|
 |rect_height    | @1|     |   |    |
 |-----------------------------------------------------------|
 
 @1=is_show
 */

struct KLinePoint{
    uint32_t x;//x坐标
    uint32_t y;//y坐标
    //矩形框的颜色
    uint32_t rect_colot_r:4;
    uint32_t rect_colot_g:4;
    uint32_t rect_colot_b:4;
    uint32_t rect_colot_a:4;
    //矩形框的填充颜色
    uint32_t fill_colot_r:4;
    uint32_t fill_colot_g:4;
    uint32_t fill_colot_b:4;
    uint32_t fill_colot_a:4;
    
    //矩形框的高度
    uint8_t rect_h;
    uint8_t topline_h;
    uint8_t bottomline_h;
    uint8_t rect_width;
    uint8_t is_show:1;
};
typedef struct KLinePoint KLinePoint;
#endif /* LYLPoint_h */
