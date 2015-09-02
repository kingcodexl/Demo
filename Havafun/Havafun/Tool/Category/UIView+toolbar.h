//
//  UIView+toolbar.h
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/6/14.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (toolbar)

//=====================================================
//键盘输入带上一项下一项的toolbar
- (UIToolbar *)addToolbarWithSegment:(SEL)segmentAction rightButton:(SEL)doneAction title:(NSString *)title withTarget:(id)target;
- (UIToolbar*)addToolBarWithPrevious:(SEL)previousSelector nextSelector:(SEL)nextSelector doneSelector:(SEL)doneSelector withTarget:(id)target;

//=====================================================
//仅有右侧按钮的toolbar
- (UIToolbar *)addToolBarWithRightSelector:(SEL)rightSelector target:(id)target title:(NSString *)title;
- (UIToolbar *)addToolBarWithLeftSelector:(SEL)leftSelector withRightSelector:(SEL)rightSelector target:(id)target title:(NSString *)title;

//=====================================================
//日期选择器
- (UIDatePicker *)addDatePickerWithTarget:(id)target selector:(SEL)selector;

//=====================================================
//选择器
- (UIPickerView *)addPickerViewWithDelegete:(id<UIPickerViewDelegate>)delegete andDataSource:(id<UIPickerViewDataSource>)datasource;

@end
