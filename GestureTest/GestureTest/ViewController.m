//
//  ViewController.m
//  GestureTest
//
//  Created by hundsun on 15/9/20.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "ViewController.h"
#import "GestureView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)awakeFromNib{
    GestureView *getstureView = [[GestureView alloc]initWithFrame:self.view.bounds];
    getstureView.backgroundColor = [UIColor whiteColor];
    self.view = getstureView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
