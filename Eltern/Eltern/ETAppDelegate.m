//
//  ETAppDelegate.m
//  Eltern
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "ETAppDelegate.h"
#import "StolzKit.h"

@interface ETAppDelegate ()

@property (strong) STLoginDirector *loginDirector;
@property (weak) IBOutlet NSTextField *loginLabel;
@property (weak) IBOutlet NSButton *loginButton;

@end

@implementation ETAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.loginDirector = [[STLoginDirector alloc] init];
}


- (IBAction)toggleLogin:(id)sender {

    if(self.loginDirector.isUserLoggedIn)
    {
        [self logOut];
    }
    else {
        [self logIn];
    }

}

#pragma mark - Login/Logout

/**
 *  This method invokes a login.
 *
 *  @discussion This is where you'd set up your Facebook keys.
 */

- (void)logIn {

    [[self loginDirector] setFacebookAppID:@""];
    [[self loginDirector] setFacebookAppSecret:@""];
    [[self loginDirector] setClientToken:@""];
    
    [self.loginDirector logUserInWithCompletion:^(BOOL success, enum STLoginState state) {
        
        if (success) {
            self.loginLabel.stringValue = NSLocalizedString(@"You are logged in.", @"A label for reporting that a user is logged in, without the username.");
            self.loginButton.title = NSLocalizedString(@"Log Out", @"A label for as button to log out.");
            
        }
        else {
            self.loginLabel.stringValue = NSLocalizedString(@"You are not logged in.", @"A label for reporting that a user is logged out.");
            self.loginButton.title = NSLocalizedString(@"Log In", @"A label for as button to log in.");
        }
        
    }];
}

/**
 *
 */

- (void)logOut
{
    [[self loginDirector] logUserOutWithCompletion:^(BOOL success, enum STLoginState state) {
        if ([self.loginDirector isUserLoggedIn]) {
            self.loginLabel.stringValue = NSLocalizedString(@"You are logged in.", @"A label for reporting that a user is logged in, without the username.");
            self.loginButton.title = NSLocalizedString(@"Log Out", @"A label for as button to log out.");
            
        }
        else {
            self.loginLabel.stringValue = NSLocalizedString(@"You are not logged in.", @"A label for reporting that a user is logged out.");
            self.loginButton.title = NSLocalizedString(@"Log In", @"A label for as button to log in.");
        }
    }];
}
 
@end
