//
//  OWBaseSessionManager.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWBaseSessionManager : NSObject
-(void) getWithParameters:(NSDictionary*) parameters url:(NSString*) url andCallback:(void (^)(NSURLSessionTask *task, id responseObject, NSError* error)) callback;
@end
