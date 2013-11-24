//
//  STTokenManager.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STToken.h"

typedef void(^STDataLoadCompletionBlock)(BOOL success);

/**
 *  The STTokenManager handles the storage of 
 *  Facebook login tokens.
 */

@interface STTokenManager : NSObject

@property (strong) STToken *appAccessToken;

#pragma mark - Read/Write 

/**
 *  Attempts to write the tokens to disk.
 *
 *  @return YES is the saving succeeded, else NO.
 */

- (BOOL)save;

/**
 *  Attempts to load the tokens from disk.
 *
 *  @return YES is the loading succeeded, else NO.
 */

- (void)loadWithCompletion:(STDataLoadCompletionBlock)completion;




@end
