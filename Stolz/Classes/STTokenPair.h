//
//  STTokenPair.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STToken;

/**
 *  This class pairs up user IDs with tokens.
 */

@interface STTokenPair : NSObject

/** The user ID associated with the token. */
@property (nonatomic, strong) NSString *userID;

/** The token to associate with the user ID. */
@property (nonatomic, strong) STToken *token;

@end
