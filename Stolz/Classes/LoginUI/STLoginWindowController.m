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
    
    NSURL *url = [[[frame dataSource] request] URL];
    
    if ([self delegate]) {
        [[self delegate] loginController:self didLoadURL:url];
    }
}

@end
