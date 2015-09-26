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
    /*Controls whether the view’s constraints need updating.
    When a property of your custom view changes in a way that would impact constraints, you can call this method to indicate that the constraints need to be updated at some point in the future. The system will then call updateConstraints as part of its normal layout pass. Updating constraints all at once just before they are needed ensures that you don’t needlessly recalculate constraints when multiple changes are made to your view in between layout passes.*/
    // 1、当自定义视图的约束改变了，就会调用这个方法，去更新约束和一些像素点。
    // 2、系统调用updateConstraints更新约束，
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
    /*
     Marks the receiver’s entire bounds rectangle as needing to be redrawn.
     You can use this method or the setNeedsDisplayInRect: to notify the system that your view’s contents need to be redrawn. This method makes a note of the request and returns immediately. The view is not actually redrawn until the next drawing cycle, at which point all invalidated views are updated.
     */
    // 1、通知系统重绘视图，会立即执行
    // 2、真实的重绘是发生在下一个绘制循环里，
    [self setNeedsDisplay];
    CGRect rect = CGRectZero;
    // 1、一般不手动调用这个方法，通过setNeedsDisplay让系统调用
    [self drawRect:rect];

    /*
     Invalidates the current layout of the receiver and triggers a layout update during the next update cycle.
     Call this method on your application’s main thread when you want to adjust the layout of a view’s subviews. This method makes a note of the request and returns immediately. Because this method does not force an immediate update, but instead waits for the next update cycle, you can use it to invalidate the layout of multiple views before any of those views are updated. This behavior allows you to consolidate all of your layout updates to one update cycle, which is usually better for performance.
     */
    // 1、使当前布局无效，在下一个更新循环里重新布局
    // 2、当你想重新布局的时候，在主线程中调用他，会立即发出通知
    // 3、同样是到下一个更新循环
    // 4、可以在任何视图更新前，让更新无效，可以让你在一次更新循环中控制布局
    [self setNeedsLayout];
    [self layoutSubviews];
    
    /*
     Lays out the subviews immediately.
     Use this method to force the layout of subviews before drawing. Using the view that receives the message as the root view, this method lays out the view subtree starting at the root.
     */
    // 1、立即更新布局，强制系统立即更新视图树的布局
    [self layoutIfNeeded];
    
    /*
     Returns the view’s alignment rectangle for a given frame.
     The constraint-based layout system uses alignment rectangles to align views, rather than their frame. This allows custom views to be aligned based on the location of their content while still having a frame that encompasses any ornamentation they need to draw around their content, such as shadows or reflections.
     The default implementation returns the view’s frame modified by the view’s alignmentRectInsets. Most custom views can override alignmentRectInsets to specify the location of their content within their frame. Custom views that require arbitrary transformations can override alignmentRectForFrame: and frameForAlignmentRect: to describe the location of their content. These two methods must always be inverses of each other.
     */
    // 1、根据所给的frame计算出对齐矩形
    // 2、约束系统根据对其矩形来对其视图而不是他们的frame，可以将视图基于他内容的位置来对齐。
    // 3、返回的是被视图alignmentRectInsets改变的frame。可以通过重写alignmentRectInsets来配置具体的内容。
    // 4、自定义视图可以通过重写 alignmentRectForFrame: and frameForAlignmentRect:来秒速视图内容的位置
    [self alignmentRectForFrame:CGRectZero];
    
    
    /*
     Returns a view used to satisfy baseline constraints.
     When you make a constraint on the NSLayoutAttributeBaseline of a view, the system aligns with the bottom of the view returned by this method. The default implementation returns the receiving (自己)view. If you override this method, the returned view must be a subview of the receiver.
     */
    // 1、返回一个满足baseline constraints的视图，默认是自己，自定义的话可以返回任意子视图
    [self viewForBaselineLayout];
    
    
    
    
}

/**
 *  更新约束条件
 */
- (void)updateConstraints{
}












@end
