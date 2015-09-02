//
//  YXYDataService.h
//  MyApp
//
//  Created by kingcodexl on 15/8/30.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void(^CompletionLoad)(NSObject *result);

typedef void (^Success)(id JSON);

typedef void (^Faile)(NSError *error);

@interface XlDataService : NSObject

/**
 *  如果请求中没有请求头，使用此方法。注意如果需要传图片则需要将图片封装成NSDate，装到params中。url为地址，params为请求体没有传nil，get和post方法可以忽略大小写
 *
 *  @param url        请求地址
 *  @param params     请求体，没有可传递nil
 *  @param httpMethod 请求方式，get，post
 *  @param block      回调函数
 *  @return AFHTTPRequestOperation
 */
+(AFHTTPRequestOperation *)requestWithURL:(NSString *)url

                                   params:(NSMutableDictionary *)params

                               httpMethod:(NSString *)httpMethod

                                    block:(CompletionLoad)block;


/**
 *  如果请求中没有请求头，使用此方法。注意如果需要传图片则需要将图片封装成NSDate，装到params中。url为地址，params为请求体没有传nil，get和post方法可以忽略大小写
 *
 *  @param url           请求地址
 *  @param params        请求体，没有可传递nil
 *  @param httpMethod    请求方式，get，post
 *  @param successBlock  请求成功回调函数
 *  @param faileBlock    请求失败回调函数
 *  @return AFHTTPRequestOperation
 */
+(AFHTTPRequestOperation *)requestWithURL:(NSString *)url

                                   params:(NSMutableDictionary *)params

                               httpMethod:(NSString *)httpMethod

                             successBlock:(Success)successBlock

                               faileBlock:(Faile)faileBlock;

/**
 *  如果请求中有请求头，使用此方法。
 *  @param url           请求地址
 *  @param params        请求体，没有可传递nil
 *  @param httpMethod    请求方式，get，post
 *  @param block          回调函数
 *  @return AFHTTPRequestOperation
 */
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url

                             requestHeader:(NSDictionary *)header

                                    params:(NSMutableDictionary *)params

                                httpMethod:(NSString *)httpMethod

                                     block:(CompletionLoad)block;



/**
 *  如果请求中有请求头，使用此方法。注意如果需要传图片则需要将图片封装成NSDate，装到params中。url为地址，params为请求体没有传nil，get和post方法可以忽略大小写
 *
 *  @param url           请求地址
 *  @param params        请求体，没有可传递nil
 *  @param httpMethod    请求方式，get，post
 *  @param successBlock  请求成功回调函数
 *  @param faileBlock    请求失败回调函数
 *  @return AFHTTPRequestOperation
 */
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url

                             requestHeader:(NSDictionary *)header

                                    params:(NSMutableDictionary *)params

                                httpMethod:(NSString *)httpMethod

                              successBlock:(Success)successBlock

                                faileBlock:(Faile)faileBlock;


@end
