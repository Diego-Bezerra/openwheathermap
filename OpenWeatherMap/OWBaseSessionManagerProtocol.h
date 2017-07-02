//
//  Header.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

//Sessions manager protocol
@protocol OWBaseSessionManagerProtocol
    -(void) getWithParameters:(NSDictionary*) parameters url:(NSString*) url andCallback:(void (^)(NSURLSessionTask *task, id responseObject, NSError* error)) callback;
@end
    

