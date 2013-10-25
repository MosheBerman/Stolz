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

/**
 *  Called after the URL finishes loading.
 */
- (void)loginController:(STLoginWindowController *)loginController didLoadURL:(NSURL *)url;

@end
