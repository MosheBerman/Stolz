//
//  STLoginDirector.m
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STLoginDirector.h"

#import "STTokenManager.h"

#import "STLoginWindowController.h"

#import "STURLs.h"

@interface STLoginDirector () <STLoginControllerWindowDelegate>

/** Stores the user's login state. */
@property (assign) enum STLoginState state;

/** This token manager handles token management. */
@property (strong) STTokenManager *tokenManager;

/**
 *  Allows the user to set the application ID. 
 */
@property (strong) NSString *facebookAppID;

/**
 *  An internal login window instance
 */
@property (strong) STLoginWindowController *loginWindowController;

/**
 *  Hang on to the login completion block
 */
@property (strong) STLoginCompletionBlock loginCompletion;

/**
 *  Hang on to the logout completion block
 */
@property (strong) STLoginCompletionBlock logoutCompletion;

@end

@implementation STLoginDirector

/** Designated initializer. */
- (id)init
{
    self = [super init];
    if (self) {
        
        _loginWindowController = [[STLoginWindowController alloc] initWithWindowNibName:@"STLoginWindowController"];
    }
    return self;
}

/**
 *  @return a singleton login director instance
 */

+ (id)sharedDirector
{
    static STLoginDirector *director = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        director = [[STLoginDirector alloc] init];
    });
    
    return director;
}

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
    
    /**
     *  Hang on to the completion.
     */
    
    self.loginCompletion = completion;
    
    /**
     *  Perform the login.
     */
    
    NSString *loginString = [NSString stringWithFormat:kLoginDialogURL, self.facebookAppID, kRedirectURI];
    NSURL *loginURL = [NSURL URLWithString:loginString];
    
    /**
     *  Prepare and load the login window
     */
    [[self loginWindowController] setDelegate:self];
    [[self loginWindowController] showWindow:nil];
    [[self loginWindowController] loadURL:loginURL];

}


/**
 *  STLoginWindowViewControllerDelegate
 */

- (void)loginController:(STLoginWindowController *)loginWindowController didAcquireToken:(NSString *)token withExpirationInterval:(NSInteger)interval
{
    /**
     *  TODO: Properly store permissions here.
     */
    
    /** 
     *  Save the state.
     */
    
    self.state = STLoginStateLoggedIn;
    
    /**
     *  Then call the callback.
     */
    
    if (self.loginCompletion) {
        self.loginCompletion(YES, self.state);
    }
}

- (void)loginControllerFailedToAcquireToken:(STLoginWindowController *)loginWindowController withError:(NSError *)error
{
    /**
     *  Save the state.
     */
    
    self.state = STLoginStateLoggedOut;
    
    /**
     *  Then call the callback.
     */
    if (self.logoutCompletion) {
        self.logoutCompletion(YES, self.state);
    }
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
