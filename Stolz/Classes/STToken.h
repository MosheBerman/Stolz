//
//  STToken.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

/*
 *  The information in this class comes primarily from
 *  https://developers.facebook.com/docs/facebook-login/access-tokens/
 */
 

#import <Foundation/Foundation.h>

@interface STToken : NSObject

/**
 *  This represents the token value itself. 
 */
@property (strong) NSString *value;

/**
 *  The date (and time) that the token expires.
 *
 *  The Facebook API returns the expiration
 *  as the number of seconds until the token
 *  expires, from the time the app recieves
 *  the token. When ingesting, simply add that
 *  value (in seconds) to an NSDate representing
 *  the ingestion time and set that.
 */

@property (strong) NSDate *expirationDate;

/**
 *  When the token was issued. This is only sent by
 *  the Facebook API for long-lived tokens.
 */

@property (strong) NSDate *issueDate;

/**
 *  The machine_id for this client. Please store 
 *  this for future calls to generate a new access 
 *  token from a code. This helps identify this client 
 *  and is used to prevent spam.
 *
 *  Taken from: https://developers.facebook.com/docs/facebook-login/access-tokens/#sizes
 *
 *  (This is used when a token is obtained from a 
 *  code returned by the login API. This is not 
 *  used when a token is requested directly at login.)
 */

@property (nonatomic, strong) NSString *machineID;

/**
 *  An array containing the permissions
 *  granted by the wielder of this token.
 */

@property (strong) NSArray *scopes;

/**
 *  Extra data returned by the API at validation time.
 */

@property (strong) NSDictionary *metadata;

/**
 *  The user ID which this token applies to.
 */

@property (strong) NSString *userID;


@end
