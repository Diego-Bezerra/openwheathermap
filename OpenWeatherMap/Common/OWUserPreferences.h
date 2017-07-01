//
//  OWUserPreferences.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWUserPreferences : NSObject
    +(void) setShowTutorialKey:(BOOL) value;
    +(BOOL) getShowTutorialKey;
@end
