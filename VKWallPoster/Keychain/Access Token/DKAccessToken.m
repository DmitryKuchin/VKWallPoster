//
//  DKAccessToken.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKAccessToken.h"
#import "DKDKInternalUtility.h"
#import "DKKeychainStore.h"

#define DK_ACCESSTOKEN_USERID_KEY @"userID"
#define DK_ACCESSTOKEN_TOKENSTRING_KEY @"tokenString"
#define DK_ACCESSTOKEN_ROOT_KEY @"root"

static DKAccessToken *_currentAccessToken;

NSString *const DKAccessTokenDidChangeNotification = @"DKAccessTokenDidChangeNotification";
NSString *const DKAccessTokenDidRemovedNotification = @"DKAccessTokenDidRemovedNotification";
NSString *const DKAccessTokenDidChangeUserID = @"DKAccessTokenDidChangeUserID";
NSString *const DKAccessTokenChangeNewKey = @"DKAccessTokenChangeNewKey";
NSString *const DKAccessTokenChangeOldKey = @"DKAccessTokenChangeOldKey";

static NSString *const kDKAccessTokenUserDefaultsKey = @"com.kuchin.ru.VKWallPoster.kDKAccessTokenUserDefaultsKey";
static NSString *const kDKAccessTokenUUIDKey = @"tokenUUID";
static NSString *const kDKAccessTokenEncodedKey = @"tokenEncoded";

@interface DKAccessToken ()

@end

@implementation DKAccessToken

- (instancetype)initWithTokenString:(NSString *)tokenString
                             userID:(NSString *)userID {
    if ((self = [super init])) {
        _tokenString = [tokenString copy];
        _userID = [userID copy];
    }
    return self;
    
}

#pragma mark - Class Methods

+ (DKAccessToken *)currentAccessToken {
    return [DKAccessToken fetchAccessToken];
}

- (BOOL)isEqualToAccessToken:(DKAccessToken *)token {
    return (token &&
            [DKDKInternalUtility object:self.tokenString isEqualToObject:token.tokenString] &&
            [DKDKInternalUtility object:self.userID isEqualToObject:token.userID]);
}

+ (void)setCurrentAccessToken:(DKAccessToken *)token {
    if (!token) {
        [DKAccessToken clearCache];
        [[NSNotificationCenter defaultCenter] postNotificationName:DKAccessTokenDidRemovedNotification
                                                            object:[self class]
                                                          userInfo:nil];
    } else {
        if (token != _currentAccessToken) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            [DKDKInternalUtility dictionary:userInfo setObject:token forKey:DKAccessTokenChangeNewKey];
            [DKDKInternalUtility dictionary:userInfo setObject:_currentAccessToken forKey:DKAccessTokenChangeOldKey];
            if (![_currentAccessToken.userID isEqualToString:token.userID]) {
                userInfo[DKAccessTokenDidChangeUserID] = @YES;
            }
            
            _currentAccessToken = token;
            [DKAccessToken cacheAccessToken:token];
            [[NSNotificationCenter defaultCenter] postNotificationName:DKAccessTokenDidChangeNotification
                                                                object:[self class]
                                                              userInfo:userInfo];
        }
    }
}

+ (void)refreshCurrentAccessToken:(DKAccessTokenRequestHandler)completionHandler {
    
}

#pragma mark NSCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *tokenString = [decoder decodeObjectOfClass:[NSString class] forKey:DK_ACCESSTOKEN_TOKENSTRING_KEY];
    NSString *userID = [decoder decodeObjectOfClass:[NSString class] forKey:DK_ACCESSTOKEN_USERID_KEY];
    return [self initWithTokenString:tokenString
                              userID:userID];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.tokenString forKey:DK_ACCESSTOKEN_TOKENSTRING_KEY];
    [encoder encodeObject:self.userID forKey:DK_ACCESSTOKEN_USERID_KEY];
    [encoder encodeObject:@(self.root) forKey:DK_ACCESSTOKEN_ROOT_KEY];
}

#pragma mark - Private

+ (DKAccessToken *)fetchAccessToken{
    //return [[DKAccessToken alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uuid = [defaults objectForKey:kDKAccessTokenUserDefaultsKey];
    
    NSString *keyChainServiceIdentifier = [NSString stringWithFormat:@"com.kuchin.ru.VKWallPoster.tokencache.%@", [[NSBundle mainBundle] bundleIdentifier]];
    DKKeychainStore *_keychainStore = [[DKKeychainStore alloc] initWithService:keyChainServiceIdentifier accessGroup:nil];
    
    NSDictionary *dict = [_keychainStore dictionaryForKey:kDKAccessTokenUserDefaultsKey];
    if (![dict[kDKAccessTokenUUIDKey] isEqualToString:uuid]) {
        // if the uuid doesn't match (including if there is no uuid in defaults which means uninstalled case)
        // clear the keychain and return nil.
        [DKAccessToken clearCache];
        return nil;
    }
    
    id tokenData = dict[kDKAccessTokenEncodedKey];
    if ([tokenData isKindOfClass:[NSData class]]) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
    } else {
        return nil;
    }
}

+ (void)cacheAccessToken:(DKAccessToken *)token{
    if (!token) {
        [DKAccessToken clearCache];
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uuid = [defaults objectForKey:kDKAccessTokenUserDefaultsKey];
    if (!uuid) {
        uuid = [[NSUUID UUID] UUIDString];
        [defaults setObject:uuid forKey:kDKAccessTokenUserDefaultsKey];
        [defaults synchronize];
    }
    NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:token];
    NSDictionary *dict = @{kDKAccessTokenUUIDKey : uuid,
                           kDKAccessTokenEncodedKey : tokenData};
    NSString *keyChainServiceIdentifier = [NSString stringWithFormat:@"com.kuchin.ru.VKWallPoster.tokencache.%@", [[NSBundle mainBundle] bundleIdentifier]];
    DKKeychainStore *_keychainStore = [[DKKeychainStore alloc] initWithService:keyChainServiceIdentifier accessGroup:nil];
    [_keychainStore setDicitonary:dict
                           forKey:kDKAccessTokenUserDefaultsKey];
    
}

+ (void)clearCache{
    NSString *keyChainServiceIdentifier = [NSString stringWithFormat:@"com.kuchin.ru.VKWallPoster.tokencache.%@", [[NSBundle mainBundle] bundleIdentifier]];
    DKKeychainStore *_keychainStore = [[DKKeychainStore alloc] initWithService:keyChainServiceIdentifier accessGroup:nil];
    [_keychainStore setDicitonary:nil
                           forKey:kDKAccessTokenUserDefaultsKey];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:kDKAccessTokenUserDefaultsKey];
    [defaults synchronize];
}


@end
