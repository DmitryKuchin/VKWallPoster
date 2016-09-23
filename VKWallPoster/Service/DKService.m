//
//  DKService.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKService.h"
#import "DKAccessToken.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "AFHTTPSessionManager.h"

@interface DKService ()
@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@end

static NSString * const VK_BASE_URL = @"http://divoxi.ru/api/v1/";
static NSString * const PRIVATE_API_KEY = @"IYNXMPJOYOJXTGIURNXW";

@implementation DKService

//- (AFHTTPSessionManager *)sessionManager {
//    if (!_sessionManager) {
//        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:DIVOXI_BASE_URL]];
//        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];
//        
//        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
//        [requestSerializer setValue:PRIVATE_API_KEY forHTTPHeaderField:HeaderKeys.privateKey];
//        
//        DKAccessToken *token = [DKAccessToken currentAccessToken];
//        if (token) {
//            [requestSerializer setValue:token.tokenString forHTTPHeaderField:HeaderKeys.accessTokenKey];
//            manager.requestSerializer = requestSerializer;
//        }
//        manager.requestSerializer = requestSerializer;
//        _sessionManager = manager;
//    }
//    return _sessionManager;
//}
//
//+ (DKService *)sharedInstance {
//    static dispatch_once_t onceToken;
//    static DKService *service = nil;
//    dispatch_once(&onceToken, ^{
//        service = [[DKService alloc] init];
//        [[NSNotificationCenter defaultCenter] addObserver:service
//                                                 selector:@selector(accessTokenDidRemovedNotification:)
//                                                     name:SCAccessTokenDidRemovedNotification
//                                                   object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:service
//                                                 selector:@selector(accessTokenDidChangedNotification:)
//                                                     name:SCAccessTokenDidChangeNotification
//                                                   object:nil];
//    });
//    return service;
//}

@end
