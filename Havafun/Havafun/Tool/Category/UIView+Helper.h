//
//  UIView+Helper.h
//  hundsun-hybrid-iphone-1.0
//
//  Created by kingcodexl on 15/6/14.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//  对UIView的Frame进行封装，方便快速获取Frame各项属性

#import <UIKit/UIKit.h>

@interface UIView (Helper)

- (CGFloat)frameX;
- (void)setFrameX:(CGFloat)x;

- (CGFloat)frameY;
- (void)setFrameY:(CGFloat)y;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

- (CGFloat)left;
- (void)setLeft:(CGFloat)left;

- (CGFloat)top;
- (void)setTop:(CGFloat)top;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (void)removeAllSubviews;

@end
