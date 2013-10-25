//
//  STToken.h
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STToken : NSObject

/**
 *  This represents the token value itself. 
 */
@property (nonatomic, strong) NSString *value;

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

@property (nonatomic, strong) NSString *expirationDate;

/**
 *  The machine_id for this client. Please store 
 *  this for future calls to generate a new access 
 *  token from a code. This helps identify this client 
 *  and is used to prevent spam.
 *
 *  Taken from: https://developers.facebook.com/docs/facebook-login/access-tokens/#sizes
 */

@property (nonatomic, strong) NSString *machineID;

@end
