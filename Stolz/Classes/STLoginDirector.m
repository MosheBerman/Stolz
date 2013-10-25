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
 *  TODO: Change this so the web browser 
 *  passes back the URL that it received.
 *  This will make an iOS port easier.
 */

- (void)loginController:(STLoginWindowController *)loginWindowController didAcquireToken:(NSString *)token withExpirationInterval:(NSInteger)interval
{
    /**
     *  Properly store permissions here.
     */
    
    /** Calculate the expiration date. */
    NSDate *expirationDate = [[NSDate date] dateByAddingTimeInterval:interval];
    
    /** Build a URL to confirm the token's validity. */
    NSURL *tokenConfirmationURL = [NSURL URLWithString:[NSString stringWithFormat:kTokenInspectionURL, token, self.facebookAppID]];
    
    /** Put the URL into a request. */
    NSURLRequest *request = [NSURLRequest requestWithURL:tokenConfirmationURL];
    
    /** A flag to store success/failure in. */
    __block BOOL success = YES;
    
    /** Fire off the request. */
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (!error && data) {
            
            /** Attempt to read the JSON data into a dictionary. */
            NSDictionary *validationResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            /** If we've got a dictionary, let's check it out. */
            if (!error) {
                
                /** "Unpack" the response from the data wrapper. */
                validationResponse = validationResponse[@"data"];
                
                
                /**
                 *  TODO: Store this token in the token manager.
                 */
                
                /**
                 *  TODO: Read up on long-lived tokens:
                 *  https://developers.facebook.com/docs/facebook-login/access-tokens/#extending
                 */
                
            }
        }
        else {
            success = !error;
        }
        
    }];
    
    /** 
     *  Save the state.
     */
    self.state = success ? STLoginStateLoggedIn : STLoginStateLoggedNotAuthorized;
    
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
