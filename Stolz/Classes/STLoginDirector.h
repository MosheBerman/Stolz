//
//  STLoginDirector.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STLoginStates.h"
#import "STHandlers.h"

/**
 *  This class manages the login interaction for a 
 *  Facebook user in an OS X app. As per the 
 *  Facebook documentation, there are several
 *  stages to handling login.
 *  
 *  The relevant page is here:
 *  https://developers.facebook.com/docs/facebook-login/login-flow-for-web-no-jssdk/#checklogin
 *
 */

@interface STLoginDirector : NSObject

/**
 *  @return a singleton login director instance
 */

+ (id)sharedDirector;

/**
 *  Checking login status
 *
 */

/** 
 *  Checks if the user is logged in. 
 *  @return YES if logged in, else NO. 
 */

- (BOOL)isUserLoggedIn;

/**
 *  Checks if the user is authorized.
 *
 *  @discussion Facebook discusses the difference
 *  between authorization and log in.
 *
 *  @return YES if the user is authorized, else NO.
 */
 
- (BOOL)isUserAuthorized;

/**
 *  Logging a user in.
 *
 *  @param completion A completion block to execute after the login is finished.
 */

- (void)logUserInWithCompletion:(STLoginCompletionBlock)completion;

/**
 *  Logging a user out.
 *
 *  @param completion A completion block to execute after the login is finished.
 */

- (void)logUserOutWithCompletion:(STLoginCompletionBlock)completion;

/**
 *  Facebook App ID
 *
 *  @param appID Your Facebook app ID.
 */

- (void)setFacebookAppID:(NSString *)appID;

/**
 *  Facebook App Secret
 *
 *  @param appSecret Your Facebook app secret key.
 */

- (void)setFacebookAppSecret:(NSString *)appSecret;

/**
 *  Sets the Facebook client token.
 *
 *  @param clientToken Your Facebook app client token.
 */

- (void)setClientToken:(NSString *)clientToken;

@end
