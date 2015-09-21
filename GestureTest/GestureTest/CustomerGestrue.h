//
//  CustomerGestrue.h
//  GestureTest
//
//  Created by hundsun on 15/9/21.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>
// 手势方向
typedef NS_ENUM(NSInteger, Direction){
    DirectionUnknown,
    DirectionLeft,
    DirectionRight
};

@interface CustomerGestrue : UIGestureRecognizer
// 注意命名中使用cur last等
/**
 *  点击次数
 */
@property (nonatomic, assign) NSInteger tickleCount;
/**
 *  点击点
 */
@property (nonatomic, assign) CGPoint curTickleStart;
/**
 *  方向
 */
@property (nonatomic, assign) Direction lastDirection;

@end
/**
 * 自定义手势，需要实现：
 – touchesBegan:withEvent:
 – touchesMoved:withEvent:
 – touchesEnded:withEvent:
 - touchesCancelled:withEvent:
 
 
 */