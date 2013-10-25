//
//  STLoginWindowController.h
//  Stolz
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "STLoginControllerWindowDelegate.h"

@interface STLoginWindowController : NSWindowController

/**
 *  The delegate will be informed when the loading changes.
 */
@property (assign) id<STLoginControllerWindowDelegate> delegate;

/**
 *  Loads a specified URL into the browser frame.
 *
 *  @param the url to load.
 */

- (void)loadURL:(NSURL *)url;

@end
