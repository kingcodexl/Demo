//
//  GestureView.m
//  GestureTest
//
//  Created by hundsun on 15/9/20.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "GestureView.h"

@implementation GestureView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addGestureToView];
    }
    return self;
}

- (void)addGestureToView{
    
    /**
     UITapGestureRecognizer
     UIPinchGestureRecognizer
     UIRotationGestureRecognizer
     UISwipeGestureRecognizer
     UIPanGestureRecognizer
     UILongPressGestureRecognizer
     */
    CGFloat margin = 20;
    CGRect panRect = CGRectMake(0, 50, 50, 50);
    CGRect tapRect = CGRectMake(0, CGRectGetMaxY(panRect) + margin, 50, 50);
    CGRect pinRect = CGRectMake(0, CGRectGetMaxY(tapRect) + margin, 50, 50);
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(handlePan:)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(tap:)];
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(handlePinch:)];
    UIRotationGestureRecognizer *rotateRecognizer = [[UIRotationGestureRecognizer alloc]
                                                        initWithTarget:self
                                                                action:@selector(handleRotate:)];
    
    [self configGesture:panRect gesture:panGesture];
    
    
    
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
- (void)pan:(UIPanGestureRecognizer *)gesture{
    // 获取在特定view上位移到具体的点
    CGPoint point = [gesture translationInView:self];
    gesture.view.center = CGPointMake(gesture.view.center.x + point.x, gesture.view.center.y + point.y);
    // Sets the translation value in the coordinate system of the specified view.
    // Changing the translation value resets the velocity of the pan.
    [gesture setTranslation:CGPointZero inView:gesture.view];
}

- (void)tap:(UITapGestureRecognizer *)getsture{
    getsture.view.backgroundColor = [GestureView randomColor];
    
}

// 拖动有滑动的效果  拖动(pan手势)速度(以较快的速度拖放后view有滑行的效果)
- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        // 速率
        CGPoint velocity = [recognizer velocityInView:self];
        // 放大
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        // 滑动
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
@end
