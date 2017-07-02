//
//  JsonReader.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReaderProtocol.h"

@interface JsonReader : NSObject <ReaderProtocol>
-(id) readDataWithDictionary:(NSDictionary*) dictionary model:(Class) model error:(NSError**)err;
@end
