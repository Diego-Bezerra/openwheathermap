//
//  ReaderFactory.m
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import "ReaderFactory.h"

@implementation ReaderFactory

+(id<ReaderProtocol>) getReader:(ReaderType) readerType {
    switch (readerType) {
        case JSON_READER:
            return [[JsonReader alloc] init];
            break;
        case XML_READER:
            return nil;
        default:
            return nil;
            break;
    }
}

@end
