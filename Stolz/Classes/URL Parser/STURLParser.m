//
//  STURLParser.m
//  Stolz
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STURLParser.h"

@implementation STURLParser

- (NSDictionary *)parametersFromURL:(NSURL *)url
{
    return [self parametersFromURL:url usingDelimiter:@"?"];
}
/**
 *  This method converts a URL into a string and
 *  parses the parameters it contains.
 */

- (NSDictionary *)parametersFromURL:(NSURL *)url usingDelimiter:(NSString *)delimiter
{
    
    /** Prepare a default return value. */
    NSMutableDictionary *parameters = nil;
    
    /** Convert the URL to an absolute string. */
    NSString *stringRepresentation = [url absoluteString];
    
    /** Check for the location of the query separator. */
    NSInteger indexOfQuerySeparator = [stringRepresentation rangeOfString:delimiter].location;
    
    /** If it exists and isn't the last character, we have some sort of query string. */
    BOOL urlContainsQueryString =  indexOfQuerySeparator != NSNotFound && (indexOfQuerySeparator+1) != stringRepresentation.length;
    
    if(urlContainsQueryString)
    {
        /** Now we attempt to parse the parameters. */
        NSString *unparsedParameters = [stringRepresentation componentsSeparatedByString:delimiter][1];
    
        /** Ensure we have at least one parameter in the query string. */
        BOOL uparsedParametersContainAtLeastOneParameter = [unparsedParameters rangeOfString:@"="].location != NSNotFound;
    
        /** If we have at least one parameter, we need to process the parameters. */
        if (uparsedParametersContainAtLeastOneParameter) {
            
            /** Prepare a mutable dictionary to return. */
            parameters = [[NSMutableDictionary alloc] init];
            
            
            /** Get an array of keys-value pairs. */
            NSArray *allKeyValuePairs = [unparsedParameters componentsSeparatedByString:@"&"];
            
            /** Iterate the pairs and split them into keys and values. */
            for (NSString *pair in allKeyValuePairs) {
                
                /** Split the key from the value. (Keep it mutable for the next step.) */
                NSMutableArray *splitPair = [[pair componentsSeparatedByString:@"="] mutableCopy];;
                
                /** To ensure we don't attempt to insert a nil object, check for one length arrays. */
                if ([splitPair count] == 1) {
                    [splitPair addObject:[NSNull null]];
                }
                
                /** Now add the object to the return dictionary. */
                parameters[splitPair[0]] = splitPair[1];
            }
            
            
        }
    }
    
    /** Now return. */
    return parameters;
}


@end
