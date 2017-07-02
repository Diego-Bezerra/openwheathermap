//
//  ReaderProtocol.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

//To read data
#import <JSONModel/JSONModel.h>

@protocol ReaderProtocol
-(id) readDataWithDictionary:(NSDictionary*) dictionary model:(Class) model error:(NSError**)err;
@end
