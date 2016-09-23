//
//  DKAccessToken.h
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DKAccessToken;

typedef void (^DKAccessTokenRequestHandler)(DKAccessToken *result, NSError *error);

/*
 @abstract Notification indicating that the `currentAccessToken` has changed.
 @diDKussion the userInfo dictionary of the notification will contain keys
 `DKAccessTokenChangeOldKey` and
 `DKAccessTokenChangeNewKey`.
 */
extern NSString *const DKAccessTokenDidChangeNotification;

/**
 Нотификация сообщающая о том, что настоящий Access Token был удален из хранилища.
 */
extern NSString *const DKAccessTokenDidRemovedNotification;

/*
 @abstract A key in the notification's userInfo that will be set
 if and only if the user ID changed between the old and new tokens.
 @diDKussion Token refreshes can occur automatically with the SDK
 which do not change the user. If you're only interested in user
 changes (such as logging out), you should check for the existence
 of this key. The value is a NSNumber with a boolValue.
 */
extern NSString *const DKAccessTokenDidChangeUserID;

/*
 @abstract key in notification's userInfo object for getting the old token.
 @diDKussion If there was no old token, the key will not be present.
 */
extern NSString *const DKAccessTokenChangeOldKey;

/*
 @abstract key in notification's userInfo object for getting the new token.
 @diDKussion If there is no new token, the key will not be present.
 */
extern NSString *const DKAccessTokenChangeNewKey;

@interface DKAccessToken : NSObject <NSSecureCoding>

/*
 @abstract Returns the opaque token string.
 */
@property (readonly, copy, nonatomic) NSString *tokenString;

/*
 @abstract Returns the user ID.
 */
@property (readonly, copy, nonatomic) NSString *userID;

/*
 @abstract Returns the user is root.
 */
@property (readonly, assign, nonatomic) BOOL root;

/*
 @abstract Initializes a new instance.
 @param tokenString the opaque token string.
 @param userID the user ID.
 @diDKussion This initializer should only be used for aDKanced apps that
 manage tokens explicitly. Typical login flows only need to use `DKLoginManager`
 along with `+currentAccessToken`.
 */

- (instancetype)initWithTokenString:(NSString *)tokenString
                             userID:(NSString *)userID;

- (BOOL)isEqualToAccessToken:(DKAccessToken *)token;

/*
 @abstract Returns the "global" access token that represents the currently logged in user.
 */
+ (DKAccessToken *)currentAccessToken;

/*
 @abstract Sets the "global" access token that represents the currently logged in user.
 @param token The access token to set.
 @diDKussion This will broadcast a notification and save the token to the app keychain.
 */
+ (void)setCurrentAccessToken:(DKAccessToken *)token;


/*
 @abstract Refresh the current access token's permission state and extend the token's expiration date,
 if possible.
 @param completionHandler an optional callback handler that can surface any errors related to permission refreshing.
 @diDKussion On a successful refresh, the currentAccessToken will be updated so you typically only need to
 observe the `DKAccessTokenDidChangeNotification` notification.
 
 If a token is already expired, it cannot be refreshed.
 */
+ (void)refreshCurrentAccessToken:(DKAccessTokenRequestHandler)completionHandler;

@end
