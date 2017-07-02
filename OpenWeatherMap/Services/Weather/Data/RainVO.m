//
//  RainVO.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "RainVO.h"

@implementation RainVO
    
+ (JSONKeyMapper *)keyMapper {
        return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"threeH": @"3h"}];
}
@end
