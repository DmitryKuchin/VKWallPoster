//
//  ViewController.m
//  VKWallPoster
//
//  Created by Дмитрий on 23.09.16.
//  Copyright © 2016 Dmitry Kuchin. All rights reserved.
//

#import "DKAuthorizationViewController.h"
#import <SafariServices/SafariServices.h>
#import "DKWallUserViewController.h"
#import "DKAccessToken.h"
#import "DKUser.h"
#import <VKSdk.h>

NSString *const kACCESS_TOKEN = @"accessToken";
NSString *const kUSERID = @"identifier";

@interface DKAuthorizationViewController () <VKSdkDelegate, VKSdkUIDelegate>

@end

@implementation DKAuthorizationViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self authorizatingUser];
}

#pragma mark - Initional Methods

-(void)authorizatingUser {
    [[VKSdk instance] registerDelegate:self];
    [[VKSdk instance] setUiDelegate:self];
    
    NSArray *scope = @[VK_PER_AUDIO, VK_PER_DOCS, VK_PER_WALL, VK_PER_PHOTOS];
    
   // NSLog(@"%@ %@", [DKAccessToken currentAccessToken].tokenString, [DKAccessToken currentAccessToken].userID );
    
    [VKSdk wakeUpSession:scope completeBlock:^(VKAuthorizationState state, NSError *error) {
        if (state == VKAuthorizationAuthorized) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [[UIStoryboard storyboardWithName:@"WallUser" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DKWallUserViewController class])];
        } else {
            [VKSdk authorize:scope];
        } 
    }];
    
    
}

#pragma mark - VKSdkDelegate

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    switch (result.state) {
        case VKAuthorizationAuthorized:
        case VKAuthorizationPending: {

            DKAccessToken *token = [[DKAccessToken alloc]initWithTokenString:result.token.accessToken userID:result.token.userId];
            
            [DKAccessToken setCurrentAccessToken:token];
            
            [UIApplication sharedApplication].keyWindow.rootViewController = [[UIStoryboard storyboardWithName:@"WallUser" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DKWallUserViewController class])];
        }
            break;
        case VKAuthorizationError:
            NSLog(@"error statement");
            break;
        default:
            break;
    }
    
}

- (void)vkSdkUserAuthorizationFailed {
    NSLog(@"FAIL");
}

- (void)vkSdkAuthorizationStateUpdatedWithResult:(VKAuthorizationResult *)result {
    
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    
}

#pragma mark - Other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
