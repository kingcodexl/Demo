//
//  GestureView.h
//  GestureTest
//
//  Created by hundsun on 15/9/20.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureView : UIView

@end

/**
  UITapGestureRecognizer敲击手势（单击和双击）
 　UIPanGestureRecognizer（拖动手势）
 　UIPinchGestureRecognizer（缩放手势）
 　UISwipeGestureRecognizer（擦碰手势）
 　UIRotationGestureRecognizer（旋转手势）
 　UILongPressGestureRecognizer（长按手势）
 
 

 上面的手势对应的操作是：

 Tap（点一下）
 Pinch（二指往內或往外拨动，平时经常用到的缩放）
 Rotation（旋转）
 Swipe（滑动，快速移动）
 Pan （拖移，慢速移动）
 LongPress（长按）
 
 
 改变默认的事件传递顺序
 你可以通过改变UIGestureRecognizer子类的属性来改变默认的事件传递
 @property(nonatomic) BOOL delaysTouchesBegan;         // default is NO.  causes all touch events to be delivered to the target view only after this gesture has failed recognition. set to YES to prevent views from processing any touches that may be recognized as part of this gesture
 @property(nonatomic) BOOL delaysTouchesEnded;         // default is YES. causes touchesEnded events to be delivered to the target view only after this gesture has failed recognition. this ensures that a touch that is part of the gesture can be cancelled if the gesture is recognized
 如果一个gesture recognizer检测到了一个不属于它的touch,它将手势直接发送给它的view,此时会调用ignoreTouch:forEvent: 方法直接传递给view.
 

 */