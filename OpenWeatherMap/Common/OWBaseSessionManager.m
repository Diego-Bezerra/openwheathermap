//
//  OWBaseSessionManager.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "OWBaseSessionManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation OWBaseSessionManager
    
    NSTimeInterval const timeInterval = 10;
    
    #pragma mark OWBaseSessionManagerProtocol 
    -(void) getWithParameters:(NSDictionary*) parameters url:(NSString*) url andCallback:(void (^)(NSURLSessionTask *task, id responseObject, NSError* error)) callback {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = timeInterval;
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            callback(task, responseObject, nil);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            callback(operation, nil, error);
        }];
    }
    
@end
