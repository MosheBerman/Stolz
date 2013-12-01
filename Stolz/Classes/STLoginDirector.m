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

#import "STURLParser.h"

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
 *  Allows the user to set the application secret.
 */
@property (strong) NSString *facebookAppSecret;

/**
 *  The app's client token
 */

@property (strong) NSString *clientToken;

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
        _state = STLoginStateLoggedOut;
        _loginWindowController = [[STLoginWindowController alloc] initWithWindowNibName:@"STLoginWindowController"];
        _tokenManager = [[STTokenManager alloc] init];
        _permissionsToRequest = [[NSMutableArray alloc] init];
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
    
    NSString *scope = [[self permissionsToRequest] componentsJoinedByString:@","];

    NSString *baseURL = kFacebookLoginDialogURL;
    
    /* If there are permissions to request, use the scope URL. */
    if ([[self permissionsToRequest] count]) {
        baseURL = kFacebookLoginDialogURLWithScope;
    }
    
    NSString *loginString = [NSString stringWithFormat:kFacebookLoginDialogURLWithScope, self.facebookAppID, kFacebookRedirectURI, scope];
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
 *
 *  This method gets called with the URL that the
 *  loginWindowController receives
 */

- (void)loginController:(STLoginWindowController *)loginController didLoadURL:(NSURL *)url
{
    
    STURLParser *parser = [[STURLParser alloc] init];
    
    NSDictionary *parameters = [parser parametersFromURL:url usingDelimiter:@"#"];
    
    /**
     *  If the using the hash didn't yield
     *  the parameter we want, try the default
     *  query seperator.
     */
    if (!parameters[@"access_token"]) {
        parameters = [parser parametersFromURL:url];
    }
    
    /** If we get a token back, this is optimal. */
    if (parameters[@"access_token"]) {

        /** A flag to store success/failure in. */
        __block BOOL success = YES;
        
        /**
         *  Save the state.
         */
        self.state = success ? STLoginStateLoggedIn : STLoginStateLoggedNotAuthorized;
        
        /**
         *  Before we finish the login process, grab the user's
         *  ID from Facebook, so we can properly log out.
         */
        
        NSString *formattedString = [NSString stringWithFormat:@"https://graph.facebook.com/me?access_token=%@", parameters[@"access_token"]];
        NSURL *url = [NSURL URLWithString:formattedString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            
            [[self loginWindowController] close];
            
            if (!error && data) {
                
                /** Attempt to read the JSON data into a dictionary. */
                NSDictionary *validationResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                
                /** If we've got a dictionary, let's check it out. */
                if (!error) {
                    
                    /**
                     *  Check for a validation error.
                     */
                    
                    if (validationResponse[@"error"]) {
                        
                        [self showErrorAlertWithDictionary:validationResponse[@"error"]];
                        
                    }
                    
                    /**
                     *  If there is none, try to parse the data.
                     */
                    
                    else {
                        
                        /**
                         *      Create a token.
                         */
                        
                        STToken *token = [[STToken alloc] init];
                        [token setValue:parameters[@"access_token"]];
                        [token setUserID:validationResponse[@"id"]];
                        
                        /**
                         *  Add the token to the token manager
                         */
                        
                        [[self tokenManager] setAppAccessToken:token];
                        
                        /**
                         *  Then call the callback.
                         */
                        
                        if (self.loginCompletion) {
                            self.loginCompletion(success, self.state);
                        }
                        
                    }
                    
                }
            }
            
        }];
    }
    
    /** If we get a code, we've got to do some more things. */
    else if(parameters[@"code"]) {
        //  TODO: Implement this later.
        //  It's not really necessary, since we're targeting token based login.
        //  This is here as a safety in case Facebook changes things sometime in
        //  the future.
    }
    
    /** Handle a case where we've failed. */
    else if (parameters[@"error_reason"]){
        [self showErrorAlertWithDictionary:parameters[@"error"]];
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
    
    NSString *userID = [[[self tokenManager] appAccessToken] userID];
    NSString *accessToken = [[[self tokenManager] appAccessToken] value];
    
    NSString *urlString = [NSString stringWithFormat:kFacebookDeauthorizeURL, userID, accessToken];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"DELETE"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {

        if (completion) {
            self.state = STLoginStateLoggedOut;
            completion(YES, STLoginStateLoggedOut);
        }
    }];
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

/**
 *  Show an error.
 */

- (void)showErrorAlertWithDictionary:(NSDictionary *)dictionary
{
    
    NSInteger code = [dictionary[@"code"] integerValue];
    NSString *message = dictionary[@"message"];
    NSError *error = [NSError errorWithDomain:message code:code userInfo:dictionary];
    
    /** Inform the user that login failed.  */
    NSAlert *alert = [NSAlert alertWithError:error];
    [alert runModal];
}
@end
