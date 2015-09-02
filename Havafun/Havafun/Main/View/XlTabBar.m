//
//  XlTabBar.m
//  Havafun
//
//  Created by kingcodexl on 15/9/1.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import "XlTabBar.h"
#import "XlBarBtn.h"

//可以点击按钮的背景
#define BTNTONNORCOLOR [UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1]
//不可以点击按钮的背景，也就选中的
#define BTNTONDISCOLOR [UIColor colorWithRed:183/255.0 green:20/255.0 blue:28/255.0 alpha:1]
#define BTNW [UIScreen mainScreen].bounds.size.width/5.0
#define BTNH    49
#define BTNCOUNT 5

@interface XlTabBar()
/**
 *  记录选中的btnton
 */
@property (nonatomic,strong) XlBarBtn *selectbtn;

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation XlTabBar

#pragma  mark - 添加子视图
- (void)addImageView{
    UIImageView *imageView = [[UIImageView alloc]init];
    //设置背景图片
    imageView.image = [UIImage imageNamed:@""];
    self.imgView = imageView;
    
    [self addSubview:self.imgView];
}

- (void)addBarBtnWithNorName:(NSString *)norName andDisName:(NSString *)disName andTitle:(NSString *)btnTitle{
    XlBarBtn *btn = [[XlBarBtn alloc]init];
    
    [btn setImage:[UIImage imageNamed:disName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:norName] forState:UIControlStateDisabled];
    
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setTitleColor:BTNTONNORCOLOR forState:UIControlStateNormal];
    [btn setTitleColor:BTNTONDISCOLOR forState:UIControlStateDisabled];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    //让第一按钮默认为选中状态
    if (self.subviews.count == 2) {
        btn.tag = 1;
        [self btnClick:btn];
    }
    
    
}

#pragma  mark - 点击按钮触发
- (void)btnClick:(XlBarBtn *)btn{
    if ([self.delegate respondsToSelector:@selector(changeButIndexFrom:to:)]) {
        //切换选中的按钮
        [self.delegate changeButIndexFrom:self.selectbtn.tag to:btn.tag];
    }
    //改变按钮状态，切换背景
    _selectbtn.enabled = YES;
    _selectbtn = btn;
    btn.enabled = NO;
}

#pragma mark - 在layoutSubviews中重新不均子视图
- (void)layoutSubviews{
    UIImageView *imageView = (UIImageView *)self.subviews[0];
    imageView.frame=self.bounds;
    //因为子视图imageView,默认先添加，所以需要处理tag
    for (int i = 1; i < self.subviews.count; i++) {
        XlBarBtn *btn = (XlBarBtn *)self.subviews[i];
        
        CGFloat btnW = BTNW;
        CGFloat btnH = BTNH;
        CGFloat btnx = (i-1)*btnW;
        CGFloat btny = 0.0;
        btn.frame = CGRectMake(btnx, btny, btnW, btnH);
        btn.tag=i-1;
    }
}


@end
