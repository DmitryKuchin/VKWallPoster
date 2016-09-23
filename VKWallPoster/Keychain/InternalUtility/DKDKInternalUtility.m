//
//  DKDKInternalUtility.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKDKInternalUtility.h"

@implementation DKDKInternalUtility

+ (void)dictionary:(NSMutableDictionary *)dictionary setObject:(id)object forKey:(id<NSCopying>)key
{
    NSParameterAssert(dictionary);
    NSParameterAssert(key);
    
    if (object && key) {
        [dictionary setObject:object forKey:key];
    }
}

+ (BOOL)object:(id)object isEqualToObject:(id)other;
{
    if (object == other) {
        return YES;
    }
    if (!object || !other) {
        return NO;
    }
    return [object isEqual:other];
}

@end
