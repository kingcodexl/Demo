//
//  NSString+FormatIdentityNo.m
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/7/7.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

#import "NSString+FormatIdentityNo.h"

@implementation NSString (FormatIdentityNo)

//格式化证件号码
+ (NSString *)formatIdentityno:(NSString *)identityno {
    if (!identityno || [@"" isEqualToString:identityno]) {
        return @"";
    }
    NSInteger length = identityno.length;
    NSString *subString = [identityno substringToIndex:4];
    NSString *replactString = [identityno substringFromIndex:length-4];
    
    NSInteger subcount = length-8;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < subcount; i++) {
        [str appendString:@"*"];
    }
    NSString *temp = [NSString stringWithFormat:@"%@%@%@", subString, str, replactString];
    return temp;
}

@end
