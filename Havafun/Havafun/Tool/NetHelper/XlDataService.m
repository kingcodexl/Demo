//
//  YXYDataService.m
//  MyApp
//
//  Created by kingcodexl on 15/8/30.
//  Copyright (c) 2015年 kingcodexl. All rights reserved.
//

#import "XlDataService.h"
@implementation XlDataService


+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url params:(NSMutableDictionary *)params httpMethod:(NSString *)httpMethod successBlock:(Success)successBlock faileBlock:(Faile)faileBlock{
    //创建request请求管理对象
    
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    
    AFHTTPRequestOperation * operation = nil;
    
    //GET请求
    
    NSComparisonResult comparisonGet = [httpMethod caseInsensitiveCompare:@"GET"];
    
    if (comparisonGet == NSOrderedSame) {
        
        operation = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            successBlock(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            faileBlock(error);
            
        }];
        
    }
    
    //POST请求
    
    NSComparisonResult comparisonResultPost = [httpMethod caseInsensitiveCompare:@"POST"];
    
    if (comparisonResultPost == NSOrderedSame)
    {
        //标示
        
        BOOL isFile = NO;
        
        for (NSString * key in params.allKeys)
        {
            id value = params[key];
            
            //判断请求参数是否是文件数据
            
            if ([value isKindOfClass:[NSData class]]) {
                
                isFile = YES;
                
                break;
            }
            
        }
        
        if (!isFile) {
            
            //参数中没有文件，则使用简单的post请求
            operation =[manager POST:url
                        
                          parameters:params
                        
                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                 
                                 if (successBlock != nil) {
                                     
                                     successBlock(responseObject);
                                     
                                 }
                                 
                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                 
                                 if (faileBlock != nil) {
                                     
                                     faileBlock(error);
                                     
                                 }
                                 
                             }];
            
        }else
        {
            operation =[manager POST:url
                        
                          parameters:params
                        
           constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
               
               for (NSString *key in params) {
                   
                   id value = params[key];
                   
                   if ([value isKindOfClass:[NSData class]]) {
                       
                       [formData appendPartWithFileData:value
                                                   name:key
                                               fileName:key
                                               mimeType:@"image/jpeg"];
                       
                   }
                   
               }
               
           } success:^(AFHTTPRequestOperation *operation, id responseObject) {
               
               successBlock(responseObject);
               
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
               faileBlock(error);
               NSLog(@"请求网络失败");
               
           }];
            
        }
        
    }
    
    //设置返回数据的解析方式,支持JSON
    operation.responseSerializer =[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    return operation;
    

}

+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url requestHeader:(NSDictionary *)header params:(NSMutableDictionary *)params httpMethod:(NSString *)httpMethod successBlock:(Success)successBlock faileBlock:(Faile)faileBlock

{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    
    //添加请求头
    
    for (NSString *key in header.allKeys) {
        
        [request addValue:header[key] forHTTPHeaderField:key];
        
    }
    
    //get请求
    
    NSComparisonResult compResult1 =[httpMethod caseInsensitiveCompare:@"GET"];
    
    if (compResult1 == NSOrderedSame) {
        
        [request setHTTPMethod:@"GET"];
        
        if(params != nil)
            
        {
            
            //添加参数，将参数拼接在url后面
            
            NSMutableString *paramsString = [NSMutableString string];
            
            NSArray *allkeys = [params allKeys];
            
            for (NSString *key in allkeys) {
                
                NSString *value = [params objectForKey:key];
                
                [paramsString appendFormat:@"&%@=%@", key, value];
                
            }
            
            if (paramsString.length > 0) {
                
                [paramsString replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
                
                //重新设置url
                
                [request setURL:[NSURL URLWithString:[url stringByAppendingString:paramsString]]];
                
            }
            
        }
        
    }
    
    
    //post请求
    
    NSComparisonResult compResult2 = [httpMethod caseInsensitiveCompare:@"POST"];
    
    if (compResult2 == NSOrderedSame) {
        
        [request setHTTPMethod:@"POST"];
        
        for (NSString *key in params) {
            
            [request setHTTPBody:params[key]];
            
        }
        
    }
    
    
    //发送请求
    
    AFHTTPRequestOperation *requstOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //设置返回数据的解析方式(这里暂时只设置了json解析)
    requstOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requstOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (successBlock != nil) {
            
            successBlock(responseObject);
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", [error localizedDescription]);
        
        if (faileBlock != nil) {
            
            faileBlock(error);
            
        }
        
    }];
    
    [requstOperation start];
    
    return requstOperation;
}



+(AFHTTPRequestOperation *)requestWithURL:(NSString *)url params:(NSMutableDictionary *)params httpMethod:(NSString *)httpMethod block:(CompletionLoad)block

{
    
    //创建request请求管理对象
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation * operation = nil;
    //GET请求
    NSComparisonResult comparisonGet = [httpMethod caseInsensitiveCompare:@"GET"];
    
    if (comparisonGet == NSOrderedSame) {
        operation = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            block(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            block(error);
            
        }];
        
    }
    
    //POST请求
    
    NSComparisonResult comparisonResultPost = [httpMethod caseInsensitiveCompare:@"POST"];
    if (comparisonResultPost == NSOrderedSame)
        
    {
        //标示
        BOOL isFile = NO;
        for (NSString * key in params.allKeys)
        {
            id value = params[key];
            //判断请求参数是否是文件数据
            if ([value isKindOfClass:[NSData class]]) {
                
                isFile = YES;
                break;
            }
            
        }
        
        if (!isFile) {
            
            //参数中没有文件，则使用简单的post请求
            operation =[manager POST:url
                        
                          parameters:params
                        
                             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                 
                                 if (block != nil) {
                                     
                                     block(responseObject);
                                     
                                 }
                                 
                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                 
                                 if (block != nil) {
                                     
                                     block(error);
                                     
                                 }
                                 
                             }];
            
        }else
        {
            operation =[manager POST:url
                          parameters:params
           constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
               
               for (NSString *key in params) {
                   
                   id value = params[key];
                   
                   if ([value isKindOfClass:[NSData class]]) {
                       
                       [formData appendPartWithFileData:value
                                                   name:key
                                               fileName:key
                                               mimeType:@"image/jpeg"];
                       
                   }
                   
               }
               
           } success:^(AFHTTPRequestOperation *operation, id responseObject) {
               block(responseObject);
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               
               NSLog(@"请求网络失败");
               
           }];
            
        }
        
    }
    
    //设置返回数据的解析方式,支持JSON
    operation.responseSerializer =[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    return operation;
    
}



///url为请求地址，params是请求体，传字典进去，，httpMethod 是请求方式，block是请求完成做得工作，header是请求头，也是传字典过去（发送请求获得json数据）,如果没有则传nil,如果只有value而没有key，则key可以设置为anykey
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url

                             requestHeader:(NSDictionary *)header

                                    params:(NSMutableDictionary *)params

                                httpMethod:(NSString *)httpMethod

                                     block:(CompletionLoad)block


{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    
    //添加请求头
    
    for (NSString *key in header.allKeys) {
        
        [request addValue:header[key] forHTTPHeaderField:key];
        
    }
    
    //get请求
    
    NSComparisonResult compResult1 =[httpMethod caseInsensitiveCompare:@"GET"];
    
    if (compResult1 == NSOrderedSame) {
        
        [request setHTTPMethod:@"GET"];
        
        if(params != nil)
            
        {
            
            //添加参数，将参数拼接在url后面
            
            NSMutableString *paramsString = [NSMutableString string];
            
            NSArray *allkeys = [params allKeys];
            
            for (NSString *key in allkeys) {
                
                NSString *value = [params objectForKey:key];
                
                [paramsString appendFormat:@"&%@=%@", key, value];
                
            }
            
            if (paramsString.length > 0) {
                
                [paramsString replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
                
                //重新设置url
                
                [request setURL:[NSURL URLWithString:[url stringByAppendingString:paramsString]]];
                
            }
            
        }
        
    }
    
    
    //post请求
    
    NSComparisonResult compResult2 = [httpMethod caseInsensitiveCompare:@"POST"];
    
    if (compResult2 == NSOrderedSame) {
        
        [request setHTTPMethod:@"POST"];
        
        for (NSString *key in params) {
            
            [request setHTTPBody:params[key]];
            
        }
        
    }
    
    
    //发送请求
    
    AFHTTPRequestOperation *requstOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //设置返回数据的解析方式(这里暂时只设置了json解析)
    requstOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requstOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (block != nil) {
            
            block(responseObject);
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", [error localizedDescription]);
        
        if (block != nil) {
            
            block(error);
            
        }
        
    }];
    
    [requstOperation start];
    
    return requstOperation;
    
}


@end




