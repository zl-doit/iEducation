//
//  WebService.m
//  Created by doit on 15/4/15.
//  Copyright (c) 2015年 doit. All rights reserved.
//

#import "WebService.h"
#import "NSString+DTUtilities.h"
#import "ZLModel.h"

@implementation WebService

+(void)startWithModuleName:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms modelClass:(Class)modelClass resultIsArray:(BOOL)resultIsArray resultBlock:(WSResultBlock)resultBlock{
    
    HttpRequestModel *requestModel = [HttpRequestModel getRequestModel:module method:method parms:parms];
    
    [WebService startHttpRequest:requestModel completeHandler:^(HttpResponseModel *responseModel, BOOL success, NSError *error) {
        
        HttpResponseError *responseError = nil;
        if(success == NO){
            responseError = [[HttpResponseError alloc]init];
            responseError.type = @"system";
            responseError.code = [NSString stringWithFormat:@"%zd", error.code];
            responseError.message = error.description;
            
            resultBlock(nil, NO, responseError);
            return;
        }
        if(modelClass == nil){
            
            if(responseModel.success){
                resultBlock(responseModel.result, YES, nil);
            }
            else{
                if(responseModel.error != nil){
                    responseError= responseModel.error;
                }
                else{
                    responseError = [[HttpResponseError alloc]init];
                    responseError.type = @"system";
                    responseError.code = [NSString stringWithFormat:@"%zd", error.code];
                    responseError.message = error.description;
                }
                resultBlock(nil, NO, responseError);
            }
            return;
        }
        if (responseModel.success == NO) {
            if(responseModel.error != nil){
                responseError =  responseModel.error;
            }
            else{
                responseError = [[HttpResponseError alloc]init];
                responseError.type = @"system";
                responseError.code = [NSString stringWithFormat:@"%zd", error.code];
                responseError.message = error.description;
            }
            
            resultBlock(nil, NO, responseError);
            
            return;
        }
        NSError *err = nil;
        id result = nil ;
        if (resultIsArray) {
            
            NSArray *ary=responseModel.result;
            NSMutableArray *arrayResult=[NSMutableArray arrayWithCapacity:ary.count];
            for (NSDictionary *dic in ary) {
                [[modelClass alloc]initWithDictionary:dic];
                [arrayResult addObject:[[modelClass alloc]initWithDictionary:dic]];
            }

            result=arrayResult;
        }
        else{
            if([modelClass isSubclassOfClass:[ZLModel class]]){
                
                result = [[modelClass alloc]initWithDictionary:responseModel.result];
                
            }
            else{
                result = responseModel.result;
            }
            
        }
        resultBlock(result, YES, nil);
    }];
    
    return;
}

+(void)startWithModuleNameAndFile:(NSString *)module method:(NSString *)method parms:(NSDictionary *)parms fileName:(NSString *)fileName modelClass:(Class)modelClass resultIsArray:(BOOL)resultIsArray resultBlock:(WSResultBlock)resultBlock{
    HttpRequestModel *requestModel = [HttpRequestModel getRequestModel:module method:method parms:parms];
    [WebService starthttpRequestWithFile:requestModel fileName:fileName progress:^(NSProgress *uploadProgress) {
        
    } completeHandler:^(HttpResponseModel *responseModel, BOOL success, NSError *error) {
        HttpResponseError *responseError = nil;
        if(success == NO){
            responseError = [[HttpResponseError alloc]init];
            responseError.type = @"system";
            responseError.code = [NSString stringWithFormat:@"%zd", error.code];
            responseError.message = error.description;
            
            resultBlock(nil, NO, responseError);
            return;
        }
        if(modelClass == nil){
            if(responseModel.success){
                resultBlock(responseModel.result, YES, nil);
            }
            else{
                if(responseModel.error != nil){
                    responseError = responseModel.error;
                }
                else{
                    responseError = [[HttpResponseError alloc]init];
                    responseError.type = @"system";
                    responseError.code = [NSString stringWithFormat:@"%zd", error.code];
                    responseError.message = error.description;
                }
                resultBlock(nil, NO, responseError);
            }
            return;
        }
        if (responseModel.success == NO) {
            if(responseModel.error != nil){
                responseError =  responseModel.error;
            }
            else{
                responseError = [[HttpResponseError alloc]init];
                responseError.type = @"system";
                responseError.code = [NSString stringWithFormat:@"%zd", error.code];
                responseError.message = error.description;
            }
            
            resultBlock(nil, NO, responseError);
            
            return;
        }
        NSError *err = nil;
        id result = nil ;
        if (resultIsArray) {
            
            NSArray *ary=responseModel.result;
            NSMutableArray *arrayResult=[NSMutableArray arrayWithCapacity:ary.count];
            for (NSDictionary *dic in ary) {
                [[modelClass alloc]initWithDictionary:dic];
                [arrayResult addObject:[[modelClass alloc]initWithDictionary:dic]];
            }
            
            result=arrayResult;
        }
        else{
            if([modelClass isSubclassOfClass:[ZLModel class]]){
                
                result = [[modelClass alloc]initWithDictionary:responseModel.result];
                
            }
            else{
                result = responseModel.result;
            }
            
        }
        
        resultBlock(result, YES, nil);
    }];
}

+(void)startHttpRequest:(HttpRequestModel *)requestModel completeHandler:(WSCompleteHandlerBlock)completeHandler{
    
    NSError *error= nil;
    
    NSDictionary *dict = [requestModel getDic];
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    
    if (bodyData == nil || error) {
        completeHandler(nil, NO, error);
        return;
    }
    
    NSString *plaintext = [NSString stringWithFormat:@"%@%d", SYSTEM_CRPTY_KEY, requestModel.version];
    NSString *jsonString = [[NSString alloc]initWithData:bodyData encoding:NSUTF8StringEncoding];
    plaintext = [NSString stringWithFormat:@"%@%@",jsonString, [plaintext md5Checksum]];
    NSString *sign = [plaintext md5Checksum];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@/post", HOST_URL];
    NSURL *URL = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:URL];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:bodyData];
    [urlRequest addValue:sign forHTTPHeaderField:@"sign"];
    
    if(EDU_DEBUG){
        NSLog(@"request==>url=%@" , strUrl);
        NSLog(@"request==>json=%@", jsonString);
        NSLog(@"request==>sign=%@", sign);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            if (EDU_DEBUG) {
                NSLog(@"error: %@", error);
            }
            completeHandler(nil, NO, error);
        } else {
            if (EDU_DEBUG) {
                NSLog(@"success: %@", responseObject);
            }
            NSError *error = nil;
            HttpResponseModel * responseModel  = [[HttpResponseModel alloc]initWithDictionary:responseObject];
            if(responseModel == nil || error){
                completeHandler(nil, NO, error);
                return;
            }
            completeHandler(responseModel, YES, nil);
        }
    }];
    [dataTask resume];
}

+(void)starthttpRequestWithFile:(HttpRequestModel *)requestModel fileName:(NSString *)fileName progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgressBlock completeHandler:(WSCompleteHandlerBlock) completeHandler{
    
    NSError *error= nil;
    NSDictionary *dict = [requestModel getDic];
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    
    if (bodyData == nil || error) {
        completeHandler(nil, NO, error);
        return;
    }
    
    NSString *plaintext = [NSString stringWithFormat:@"%@%d", SYSTEM_CRPTY_KEY, requestModel.version];
    NSString *jsonString = [[NSString alloc]initWithData:bodyData encoding:NSUTF8StringEncoding];
    plaintext = [NSString stringWithFormat:@"%@%@",jsonString, [plaintext md5Checksum]];
    NSString *sign = [plaintext md5Checksum];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@/mixed", HOST_URL];
    
    NSDictionary *headers = @{@"sign": sign};
    NSDictionary *parameters = @{@"json":jsonString};
    
    if(EDU_DEBUG){
        NSLog(@"request==>url=%@", strUrl);
        NSLog(@"request==>json=%@", jsonString);
        NSLog(@"request==>sign=%@", sign);
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //处理headers
    if (headers != nil) {
        for (NSString * key in headers.allKeys) {
            [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    // old
    //    manager POST:strUrl headers:headers
    NSURLSessionDataTask *dataTask = [manager POST:strUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
        NSURL *fileURL = [NSURL fileURLWithPath:filePath];
        
        NSError *error = nil;
        [formData appendPartWithFileURL:fileURL name:@"files" error:&error];
        
    } progress:uploadProgressBlock success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (error) {
            if (EDU_DEBUG) {
                NSLog(@"error: %@", error);
            }
            completeHandler(nil, NO, error);
        } else {
            if (EDU_DEBUG) {
                NSLog(@"success: %@", responseObject);
            }
            NSError *error = nil;
            Class class = [HttpResponseModel class];
            HttpResponseModel * responseModel  = [[HttpResponseModel alloc] initWithDictionary:responseModel];
            if(responseModel == nil || error){
                completeHandler(nil, NO, error);
                return;
            }
            completeHandler(responseModel, YES, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeHandler(nil, NO, error);
    }];
    [dataTask resume];
}

@end
