//
//  UpView.m
//  StoryBoardPro
//
//  Created by hundsun on 15/9/23.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "UpView.h"

@implementation UpView

// 在旋转的时候会时候，会再次调用layoutSubviews
/**
 顺便总结一下layoutSubviews调用的情况
 1、手动[self setNeedsDisplay]
 2、添加子视图
 3、自己的frame改变
 4、屏幕状态改变，如竖屏到横屏
 */
- (void)layoutSubviews{
    NSLog(@"加载");
    
}

@end
