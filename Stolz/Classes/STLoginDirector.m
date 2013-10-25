//
//  STLoginDirector.m
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STLoginDirector.h"

#import "STTokenManager.h"

#import "STURLs.h"

@interface STLoginDirector ()

/** Stores the user's login state. */
@property (assign) enum STLoginState state;

/** This token manager handles token management. */
@property (strong) STTokenManager *tokenManager;

/**
 *  Allows the user to set the application ID. 
 */
@property (strong) NSString *facebookAppID;

@end

@implementation STLoginDirector

/**
 *  Checks if the user is logged in.
 *  @return YES if logged in, else NO.
 */

- (BOOL)isUserLoggedIn
{
    return (_state == STLoginStateLoggedIn);
}

/**
 *  Checks if the user is authorized.
 *
 *  @discussion Facebook discusses the difference
 *  between authorization and log in.
 *
 *  @return YES if the user is authorized, else NO.
 */

- (BOOL)isUserAuthorized
{
    return (_state != STLoginStateLoggedNotAuthorized);
}

/**
 *  Logging people in
 */

- (void)logUserInWithCompletion:(STLoginCompletionBlock)completion
{
    
    NSString *loginString = [NSString stringWithFormat:kLoginDialogURL, self.facebookAppID, kRedirectURI];
    NSURL *loginURL = [NSURL URLWithString:loginString];
    [[NSWorkspace sharedWorkspace] openURL:loginURL];
}

/**
 *  Logging people out
 */

- (void)logUserOutWithCompletion:(STLoginCompletionBlock)completion
{
    
}

/**
 *  Confirming Identity
 */

- (void)confirmUserIdentity
{
    
}

/**
 *  Storing access tokens and login status
 */


@end
