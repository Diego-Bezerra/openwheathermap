//
//  ReaderFactory.h
//  OpenWeatherMap
//
//  Created by Diego Bezerra Souza on 02/07/17.
//  Copyright © 2017 Diego Bezerra Souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReaderProtocol.h"
#import "JsonReader.h"

typedef enum : NSUInteger {
    JSON_READER,
    XML_READER
} ReaderType;

@interface ReaderFactory : NSObject
+(id<ReaderProtocol>) getReader:(ReaderType) readerType;
@end
