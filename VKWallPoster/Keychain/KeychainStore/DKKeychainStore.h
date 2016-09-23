//
//  DKKeychainStore.h
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKKeychainStore : NSObject

@property (nonatomic, readonly, copy) NSString *service;
@property (nonatomic, readonly, copy) NSString *accessGroup;

- (instancetype)initWithService:(NSString *)service accessGroup:(NSString *)accessGroup NS_DESIGNATED_INITIALIZER;

-(BOOL)setData:(NSData *)data forKey:(NSString *)key;
-(NSData*)dataForKey:(NSString*)key;

-(BOOL)setDicitonary:(NSDictionary *)data forKey:(NSString *)key;
-(NSDictionary*)dictionaryForKey:(NSString*)key;

-(BOOL)setString:(NSString *)string forKey:(NSString *)key;
-(NSString *)stringForKey:(NSString *)key;

-(BOOL)setNumberForKey:(NSNumber *)number forKey:(NSString *)key;
-(NSNumber *)numberForKey:(NSString *)key;

@end
