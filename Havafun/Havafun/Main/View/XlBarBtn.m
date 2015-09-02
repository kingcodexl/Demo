//
//  XlBarBtn.m
//  Havafun
//
//  Created by kingcodexl on 15/9/1.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import "XlBarBtn.h"


#define  IMAGEY 5.0
//居中
#define  IMAGEX (self.width-self.imageView.width)/2.0
#define  IMGGEWIDTH 25.0
#define  IMAGEHEIGHT 25.0

#define  LABLEFONTSIZE 10
//居中titleLabel
#define  LABLEX self.imageView.frameX - (self.titleLabel.width - self.imageView.width)/2.0


@implementation XlBarBtn

- (void)setHighlighted:(BOOL)highlighted{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.tag == 2) {
        self.imageView.width = IMGGEWIDTH+15;
        self.imageView.height = IMAGEHEIGHT+15;
        return;
    }
    self.imageView.frameY = IMAGEY;
    self.imageView.width = IMGGEWIDTH;
    self.imageView.height = IMAGEHEIGHT;
    self.imageView.frameX = IMAGEX;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.titleLabel.frameX = LABLEX;
    self.titleLabel.frameY = CGRectGetMaxY(self.imageView.frame) + 2;
    
#warning   highLevel 设置自定义字体会不断循环
    self.titleLabel.font = [UIFont systemFontOfSize:10.0];
    self.titleLabel.shadowColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}


@end
