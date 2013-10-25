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

+ (id)shareDirector;

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
 *  Logging people in
 */

- (void)logUserInWithCompletion:(STLoginCompletionBlock)completion;

/**
 *  Logging people out
 */

- (void)logUserOutWithCompletion:(STLoginCompletionBlock)completion;

/**
 *  Facebook App ID
 */

- (void)setFacebookAppID:(NSString *)appID;

@end
