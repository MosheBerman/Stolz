//
//  STLoginControllerWindowDelegate.h
//  Stolz
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STLoginWindowController;

@protocol STLoginControllerWindowDelegate <NSObject>

/** Called when the login successfully acquired a token. */
- (void)loginController:(STLoginWindowController *)loginWindowController didAcquireToken:(NSString *)token;

/**
 *  Called when the login failed to acquire a token. Query the error's userInfo for more.
 */
- (void)loginControllerFailedToAcquireToken:(STLoginWindowController *)loginWindowController withError:(NSError *)error;

@end
