//
//  NSString+CustomNil.m
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/6/13.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

#import "NSString+CustomNil.h"

@implementation NSString (CustomNil)

+ (NSString *)jsonStringToNillIfNull:(NSString *)tempstring {
    NSString *string = [NSString stringWithFormat:@"%@",tempstring];
    if ([string isEqual: [NSNull null]] || string== nil || [string isEqualToString:@"null"]|| [string isEqualToString:@"<null>"])  {
        return nil;
    }
    return string;
}

@end
