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

@end

@implementation ETAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.loginDirector = [[STLoginDirector alloc] init];
}

- (IBAction)logIn:(id)sender {
    [[self loginDirector] setFacebookAppID:@"191646724354232"];
    [self.loginDirector logUserInWithCompletion:^(BOOL success, enum STLoginState state) {
        
    }];
}

@end
