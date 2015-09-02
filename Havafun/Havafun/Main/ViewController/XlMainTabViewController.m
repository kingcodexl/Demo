//
//  XlMainTabViewController.m
//  Havafun
//
//  Created by kingcodexl on 15/9/1.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import "XlMainTabViewController.h"
#import "XlTabBar.h"
#import "XlBarBtn.h"
#define TABBARBACKCOLRO [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1]
@interface XlMainTabViewController ()<XlTabBarDelegate>


@end

@implementation XlMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubview];
   
}

- (void)configSubview{
    XlTabBar *tabBar = [[XlTabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = TABBARBACKCOLRO;
    [self.tabBar addSubview:tabBar];
    
    tabBar.delegate = self;
    [tabBar addImageView];
    
    //[tabBar addBarBtnWithNorName:@"" andDisName:@"" andTitle:@"主页"];
    [tabBar addBarBtnWithNorName:@"tabbar-home-select" andDisName:@"tabbar-home" andTitle:@"主页"];
    [tabBar addBarBtnWithNorName:@"tabbar-around-select" andDisName:@"tabbar-around" andTitle:@"附近"];
    [tabBar addBarBtnWithNorName:@"tabbar-publish" andDisName:@"tabbar-publish" andTitle:@""];
    [tabBar addBarBtnWithNorName:@"tabbar-message-select" andDisName:@"tabbar-message" andTitle:@"消息"];
    [tabBar addBarBtnWithNorName:@"tabbar-user-select" andDisName:@"tabbar-user" andTitle:@"我"];
    
    self.selectedIndex = 0;

}

#pragma  mark - XlTabBarDelegate
- (void)changeButIndexFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
