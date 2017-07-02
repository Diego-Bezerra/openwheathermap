//
//  JsonReader.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "JsonReader.h"
#import <JSONModel/JSONModel.h>

@implementation JsonReader
-(id) readDataWithDictionary:(NSDictionary*) dictionary model:(Class) model error:(NSError**)err {
    if ([model isSubclassOfClass:JSONModel.class]) {
        JSONModel* mo = [[model alloc] init];
        return [mo initWithDictionary:dictionary error:err];
    }
    return nil;
}
@end
