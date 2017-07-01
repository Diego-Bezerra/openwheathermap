//
//  OWUserPreferences.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 01/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "OWUserPreferences.h"

@implementation OWUserPreferences
    NSString* const SHOW_TUTORIAL_KEY = @"showtutorialkey";
    
    +(void) setShowTutorialKey:(BOOL) value {
        [NSUserDefaults.standardUserDefaults setBool:value forKey:SHOW_TUTORIAL_KEY];
    }
    
    +(BOOL) getShowTutorialKey {
        NSNumber* val = [NSUserDefaults.standardUserDefaults objectForKey:SHOW_TUTORIAL_KEY];
        if (!val) {
            val = @1;
        }
        return [val boolValue];
    }
@end
