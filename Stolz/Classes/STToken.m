//
//  STToken.m
//  Stolz
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import "STToken.h"

@interface STToken () <NSCoding>

@end

@implementation STToken

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        
        _expirationDate = [aDecoder decodeObjectForKey:@"expirationDate"];
        _issueDate = [aDecoder decodeObjectForKey:@"issueDate"];
        _machineID = [aDecoder decodeObjectForKey:@"machineID"];
        _scopes = [aDecoder decodeObjectForKey:@"scopes"];
        _metadata = [aDecoder decodeObjectForKey:@"metadata"];
        _userID = [aDecoder decodeObjectForKey:@"userID"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.expirationDate forKey:@"expirationDate"];
    [aCoder encodeObject:self.issueDate forKey:@"issueDate"];
    [aCoder encodeObject:self.machineID forKey:@"machineID"];
    [aCoder encodeObject:self.scopes forKey:@"scopes"];
    [aCoder encodeObject:self.metadata forKey:@"metadata"];
    [aCoder encodeObject:self.userID forKey:@"userID"];
}


@end
