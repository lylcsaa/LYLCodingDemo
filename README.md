效果代码
=====
-------
树形选择器
--------
## 效果图片
![](https://github.com/lylcsaa/LYLCodingDemo/blob/master/list.png?raw=true)  
## 使用方法
.1,json数据结构如下
```json
"subnodes": [
                                        {
                                        "node_level": 2,
                                        "name": "高一（1）班",
                                        "subnodes": [
                                                     {
                                                     "node_level": 3,
                                                     "name": "韩梅梅",
                                                     "subnodes": []
                                                     },
                                                     {
                                                     "node_level": 3,
                                                     "name": "李雷雷",
                                                     "subnodes": []
                                                     }
                                                     ]
                                        },
                                        {
                                        "node_level": 2,
                                        "name": "高一（2）班",
                                        "subnodes": [
                                                     {
                                                     "node_level": 3,
                                                     "name": "韩梅梅",
                                                     "subnodes": []
                                                     },
                                                     {
                                                     "node_level": 3,
                                                     "name": "李雷雷",
                                                     "subnodes": []
                                                     }
                                                     ]
                                        }
                                        ]
                           }
                           ```
 .2，代码中只需这样做
 ```c
 [_tree loadDatas:nodes hasSelectAllNode:YES];
 ```
 
 -------
k线
--------
## 效果图片
![](https://github.com/lylcsaa/LYLCodingDemo/blob/master/kline.png?raw=true)  
