//
//  UIView+toolbar.m
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/6/14.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

#import "UIView+toolbar.h"

@implementation UIView (toolbar)

-(void)setInputAccessoryView:(UIView *)inputAccessoryView{
    //
}

- (void)setInputView:(UIView *)inputView
{
    //
}

-(BOOL)respondsToSelector:(SEL)aSelector{
    if (aSelector == @selector(setInputAccessoryView:)){
        if ([self isKindOfClass:UISearchBar.class] || [self conformsToProtocol:@protocol(UITextInput)]){
            return TRUE;
        }
        else{
            return FALSE;
        }
    }
    return [super respondsToSelector:aSelector];
}

//=========================================================
- (UIToolbar *)addToolbarWithSegment:(SEL)segmentAction rightButton:(SEL)doneAction title:(NSString *)title withTarget:(id)target
{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    UISegmentedControl *SegmentedControl = [[UISegmentedControl alloc] initWithItems:
                                            [NSArray arrayWithObjects:@"后一项",@"前一项", nil]];
    //[SegmentedControl addTarget:target action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    SegmentedControl.frame = CGRectMake(0, 0, 100, 32);
    SegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    SegmentedControl.momentary = YES;
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:SegmentedControl];
    
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:target
                                                                              action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:title
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:target
                                                                  action:doneAction];
    
    NSArray *buttonsArry = [NSArray arrayWithObjects:segmentBarItem, btnSpace, doneButton, nil];
    [toolbar setItems:buttonsArry];
    
    
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.inputAccessoryView = toolbar;
    return toolbar;
}


//=========================================================
- (UIToolbar*)addToolBarWithPrevious:(SEL)previousSelector nextSelector:(SEL)nextSelector doneSelector:(SEL)doneSelector withTarget:(id)target
{
    
    if (![self isKindOfClass:UISearchBar.class]){
        if (![self conformsToProtocol:@protocol(UITextInput)]) {
            NSAssert(@"addToolBarfailed", @"Class doesn't conform to UITextInput protocol");
            return nil;
        }
    }
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    [toolBar setBarStyle:UIBarStyleBlack];
    [toolBar setTranslucent:YES];
    UIBarButtonItem *previousItem = [[UIBarButtonItem alloc] initWithTitle:@"上一项"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:target
                                                                    action:previousSelector];
    
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithTitle:@"下一项"
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:target
                                                                action:nextSelector];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:target
                                                                              action:doneSelector];
    
    [toolBar setItems:@[previousItem,nextItem,spaceItem,doneItem]];
    
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if ([self isKindOfClass:UISearchBar.class]){
        for(UIView *subView in self.subviews){
            if([subView isKindOfClass:UITextField.class]){
                [(UITextField *)subView setInputAccessoryView:toolBar];
            }
        }
    }
    
    if ([self isKindOfClass:UITextField.class]){
        [(UITextField *)self setInputAccessoryView:toolBar];
    }else{
        [(UITextView *)self setInputAccessoryView:toolBar];
    }
    return toolBar;
}


//==============================================================
- (UIToolbar *)addToolBarWithRightSelector:(SEL)rightSelector target:(id)target title:(NSString *)title
{
    if (![self isKindOfClass:UISearchBar.class]){
        if (![self conformsToProtocol:@protocol(UITextInput)]) {
            NSAssert(@"addToolBarfailed", @"Class doesn't conform to UITextInput protocol");
            return nil;
        }
    }
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    //toolBar.tintColor = [UIColor whiteColor];
    //    if (IS_OS_7_OR_LATER) {
    //        toolBar.barTintColor = [UIColor whiteColor];
    //    }
    [toolBar setBarStyle:UIBarStyleBlack];
    toolBar.translucent = YES;
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:rightSelector];
    [toolBar setItems:@[spaceItem,doneItem]];
    
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.inputAccessoryView = toolBar;
    return toolBar;
}

- (UIToolbar *)addToolBarWithLeftSelector:(SEL)leftSelector withRightSelector:(SEL)rightSelector target:(id)target title:(NSString *)title {
    if (![self isKindOfClass:UISearchBar.class]){
        if (![self conformsToProtocol:@protocol(UITextInput)]) {
            NSAssert(@"addToolBarfailed", @"Class doesn't conform to UITextInput protocol");
            return nil;
        }
    }
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    [toolBar setBarStyle:UIBarStyleBlack];
    toolBar.translucent = YES;
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:target action:leftSelector];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:rightSelector];
    [toolBar setItems:@[cancelItem,spaceItem,doneItem]];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.inputAccessoryView = toolBar;
    return toolBar;
}

//===============================================================
- (UIDatePicker *)addDatePickerWithTarget:(id)target selector:(SEL)selector
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 240, 180)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    NSDate *today = [[NSDate alloc] init];
    NSDate *max = today;
    
    [datePicker setLocale: [[NSLocale alloc] initWithLocaleIdentifier: @"zh_CN"]];
    [datePicker setDatePickerMode: UIDatePickerModeDate]; // 设置日期选择器模式
    [datePicker setDate: today animated: YES]; // 设置默认选中日期
    [datePicker setMaximumDate: max]; // 设置允许选择的最大日期
    [datePicker addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    self.inputView = datePicker;
    return datePicker;
}


//===================================================================

- (UIPickerView *)addPickerViewWithDelegete:(id<UIPickerViewDelegate>)delegete andDataSource:(id<UIPickerViewDataSource>)datasource
{
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 460, 320, 216)];
    pickerView.delegate = delegete;
    pickerView.dataSource = datasource;
    pickerView.showsSelectionIndicator = YES;
    self.inputView = pickerView;
    return pickerView;
}


//======================================================================
//添加输入框和发送按钮

@end
