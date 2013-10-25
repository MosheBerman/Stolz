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
 */

- (NSDictionary *)parametersFromURL:(NSURL *)url;

@end
