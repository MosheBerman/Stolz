//
//  STTokenManager.m
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STTokenManager.h"


@implementation STTokenManager

/**
 *  Attempts to write the tokens to disk.
 *
 *  @return YES is the saving succeeded, else NO.
 */

- (BOOL)save
{
    
    /** 
     *  Create a save URL
     */
    NSURL *documentsURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Stolz.tokens"];
    
    /**
     *  Wrapping the access token
     */
    
    NSDictionary *tokenData = @{@"applicationToken": self.appAccessToken};
    
    /**
     *  Write the data to disk.
     */
    
    return [NSKeyedArchiver archiveRootObject:tokenData toFile:[documentsURL path]];
}

/**
 *  Attempts to load the tokens from disk.
 */

- (void)loadWithCompletion:(STDataLoadCompletionBlock)completion
{
    /**
     *  Loading happens asynchronously.
     */
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{

        /**
         *  Create a save URL
         */
        NSURL *documentsURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Stolz.tokens"];
    
        /**
         *  Load the token data.
         */
        
		NSDictionary *tokens = [NSKeyedUnarchiver unarchiveObjectWithFile:[documentsURL path]];
		
        /**
         *  A success flag.
         */
        BOOL success = NO;
        
        /**
         *  If the tokens are loaded, then we can assign them to 
         *  the manager's variables...
         */
		if (tokens)
		{
			[self setAppAccessToken:tokens[@"applicationsToken"]];
            success = YES;
		}
        
        /**
         *  ...else, log an error.
         */
		else
		{
			NSLog(@"Failed to load...");
		}
        
        /**
         *  Call the completion.
         */
        
        if (completion) {
            completion(success);
        }
	});
}

#pragma mark - Documents Path

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
