//
//  STURLParser.h
//  Stolz
//
//  Created by Moshe Berman on 10/25/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 
 *  This class is responsible for parsing
 *  URL parameters into dictionaries. 
 */
@interface STURLParser : NSObject

/**
 *  This method converts a URL into a string and
 *  parses the parameters it contains.
 *
 *  @discussion calls parametersFromURL:usingDelimiter: passing in
 *  a question mark as the delimiter value.
 *
 *  @param url The url to parse
 *
 */

- (NSDictionary *)parametersFromURL:(NSURL *)url;

/** 
 *  This method converts a URL into a string and 
 *  parses the parameters it contains.
 *
 *  @param url The url to parse
 *  @param delimiter the delimiter between the url and the query string
 *
 *  @return A dictionary of the paramaters in the URL.
 *
 */

- (NSDictionary *)parametersFromURL:(NSURL *)url usingDelimiter:(NSString *)delimiter;

@end
