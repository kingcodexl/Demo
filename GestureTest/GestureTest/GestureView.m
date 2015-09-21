//
//  GestureView.m
//  GestureTest
//
//  Created by hundsun on 15/9/20.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "GestureView.h"

// 为了触发两个view的手势，需要实现UIGestureRecognizerDelegate协议
// 手势之间是互斥的
@interface GestureView()<UIGestureRecognizerDelegate>


@end

@implementation GestureView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addGestureToView];
    }
    return self;
}


- (void)addGestureToView{
    
    /**
       UITapGestureRecognizer敲击手势（单击和双击）
     　UIPanGestureRecognizer（拖动手势）
     　UIPinchGestureRecognizer（缩放手势）
     　UISwipeGestureRecognizer（擦碰手势）
     　UIRotationGestureRecognizer（旋转手势）
     　UILongPressGestureRecognizer（长按手势）

     */
    CGFloat margin = 20;
    CGFloat width = 50;
    CGFloat height = 50;
    CGRect panRect = CGRectMake(0, 50, width, height);
    CGRect tapRect = CGRectMake(0, CGRectGetMaxY(panRect) + margin,width, height);
    CGRect pinRect = CGRectMake(0, CGRectGetMaxY(tapRect) + margin, width, height);
    CGRect rotateRect = CGRectMake(0, CGRectGetMaxY(pinRect) + margin, width, height);
    
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(handlePan:)];
    panGesture.minimumNumberOfTouches = 1;
    panGesture.maximumNumberOfTouches = 2;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(tap:)];
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(handlePinch:)];
    UIRotationGestureRecognizer *rotateRecognizer = [[UIRotationGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(handleRotate:)];
    panGesture.delegate = self;
    tapGesture.delegate = self;
    pinchGestureRecognizer.delegate = self;
    rotateRecognizer.delegate = self;
    
    [self configGesture:panRect gesture:panGesture];
    [self configGesture:tapRect gesture:tapGesture];
    [self configGesture:pinRect gesture:pinchGestureRecognizer];
    [self configGesture:rotateRect gesture:rotateRecognizer];
    
    // 手势依赖
    // 当如果pan手势失败，就是没发生拖动，才会出发tap手势。这样如果你有轻微的拖动，那就是pan手势发生了。tap的声音就不会发出来了。
    [tapGesture requireGestureRecognizerToFail:panGesture];
    
    
    // 可以使用removeGestureRecognizer: 来移除手势
    [self removeGestureRecognizer:rotateRecognizer];
}

- (void)configGesture:(CGRect)frame gesture:(UIGestureRecognizer *)gestrue{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [GestureView randomColor];
    [view addGestureRecognizer:gestrue];
    [self addSubview:view];
    
}

#pragma mark - 产生随机颜色
+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


#pragma mark - Gestrue Selector
- (void)pan:(UIPanGestureRecognizer *)recognizer{
    
    
    // 获取在特定view上位移到具体的点
    CGPoint point = [recognizer translationInView:self];
    // 判断状态
    if ((recognizer.state == UIGestureRecognizerStateBegan) ||
        (recognizer.state == UIGestureRecognizerStateChanged)){
    recognizer.view.center = CGPointMake(recognizer.view.center.x + point.x, recognizer.view.center.y + point.y);
    // Sets the translation value in the coordinate system of the specified view.
    // Changing the translation value resets the velocity of the pan.
    [recognizer setTranslation:CGPointZero inView:recognizer.view];
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        
    }
}


- (void)tap:(UITapGestureRecognizer *)getsture{
    getsture.view.backgroundColor = [GestureView randomColor];
    
}

// 拖动有滑动的效果  拖动(pan手势)速度(以较快的速度拖放后view有滑行的效果)
// 1、监视手势是否结束 2、监视触摸的速度
/* 思路
 计算速度向量的长度（估计大部分都忘了）这些知识了。
 如果速度向量小于200，那就会得到一个小于的小数，那么滑行会很短
 基于速度和速度因素计算一个终点
 确保终点不会跑出父View的边界
 使用UIView动画使view滑动到终点
 */
- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        // 触摸的速率
        CGPoint velocity = [recognizer velocityInView:self];
        // 速度向量
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        // 如果小于200 滑行短
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        // 滑动参数
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        // 停止的点的位置
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        // 保证停止位置在view里面
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.bounds.size.height);
        // 设置动画
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
    }
}

- (void) handlePinch:(UIPinchGestureRecognizer*) recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (void) handleRotate:(UIRotationGestureRecognizer*) recognizer
{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

#pragma mark - UIGestureRecognizerDelegate

// 是否可以识别两个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return  YES;
}

// 禁止在某一视图上发生手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIControl class]])
    {
        return NO;
    }
    
    return YES;
}
@end
