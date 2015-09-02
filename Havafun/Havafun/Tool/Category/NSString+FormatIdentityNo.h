//
//  NSString+FormatIdentityNo.h
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/7/7.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

/**
 *  功能：格式化证件号码
 *
 *  版本：1.0
 */

#import <Foundation/Foundation.h>

@interface NSString (FormatIdentityNo)

//格式化证件号码
+ (NSString *)formatIdentityno:(NSString *)identityno;

@end
