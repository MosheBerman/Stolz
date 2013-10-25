//
//  STLoginWindowController.m
//  Stolz
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STLoginWindowController.h"

#import <WebKit/WebKit.h>

#import "STURLParser.h"

@interface STLoginWindowController ()

@property (unsafe_unretained) IBOutlet WebView *loginWebView;

@end

@implementation STLoginWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [_loginWebView setFrameLoadDelegate:self];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

#pragma mark - 

/**
 *  Loads a specified URL.
 */

- (void)loadURL:(NSURL *)url
{
    [[[self loginWebView] mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark -

/**
 *  Called when the URL finishes...
 */

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    
    NSURL *url = [[[[sender mainFrame] provisionalDataSource] request] URL];
    
    STURLParser *parser = [[STURLParser alloc] init];
    
    NSDictionary *parameters = [parser parametersFromURL:url];
    
    if ([self delegate]) {
        
        /** If we get a token back, this is optimal. */
        if (parameters[@"token"]) {
            [[self delegate] loginController:self didAcquireToken:parameters[@"token"]];
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
            
            NSError *error = [NSError errorWithDomain:@"com.mosheberman.facebook.userdenied" code:2 userInfo:parameters];
            
            [[self delegate] loginControllerFailedToAcquireToken:self withError:error];
        }
    }
}

@end
