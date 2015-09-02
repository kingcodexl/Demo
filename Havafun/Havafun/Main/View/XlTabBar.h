//
//  XlTabBar.h
//  Havafun
//
//  Created by kingcodexl on 15/9/1.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XlTabBarDelegate <NSObject>

@optional
- (void)changeButIndexFrom:(NSInteger) from to:(NSInteger)to;

@end

@interface XlTabBar : UIView

@property (nonatomic,weak) id<XlTabBarDelegate> delegate;

/**
 *  添加button
 *
 *  @param norName  正常状态图片
 *  @param disName  disable状态下图片
 *  @param butTitle 显示的标题
 */
- (void)addBarBtnWithNorName:(NSString *)norName andDisName:(NSString *) disName andTitle:(NSString *)butTitle;

/**
 *
 */
- (void)addImageView;

@end
