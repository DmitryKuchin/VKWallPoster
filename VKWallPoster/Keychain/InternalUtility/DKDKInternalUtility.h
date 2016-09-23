//
//  DKDKInternalUtility.h
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKDKInternalUtility : NSObject

+ (void)dictionary:(NSMutableDictionary *)dictionary setObject:(id)object forKey:(id<NSCopying>)key;;

+ (BOOL)object:(id)object isEqualToObject:(id)other;

@end
