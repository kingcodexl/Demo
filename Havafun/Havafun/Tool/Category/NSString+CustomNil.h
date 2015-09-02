//
//  NSString+CustomNil.h
//  hundsun-hybrid-iphone-1.0
//
//  Created by 姚琪 on 15/6/13.
//  Copyright (c) 2015年 杭州恒生电子股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CustomNil)

+ (NSString *)jsonStringToNillIfNull:(NSString *)tempstring;

@end
