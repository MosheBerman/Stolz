//
//  StolzTests.m
//  StolzTests
//
//  Created by Moshe Berman on 10/24/13.
//  Copyright (c) 2013 Moshe Berman. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "STURLParser.h"

@interface StolzTests : XCTestCase

@property (strong) STURLParser *parser;

@end

@implementation StolzTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _parser = [[STURLParser alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQueryString{
    
    
    NSString *sampleURL = @"http://google.com/?";
    
    NSRange range = [sampleURL rangeOfString:@"?"];
    
    NSLog(@"Length: %li, Location: %li", sampleURL.length, range.location);
    
    XCTAssertTrue((range.location + range.length) == sampleURL.length,@"");
}

/**
 *  Test URL Parsing
 */

/** Some URLs have no query string at all. */
- (void) testURLParsingFromQuerylessURL
{
    
    NSURL *sampleURL = [NSURL URLWithString:@"http://google.com/"];
    
    NSDictionary *parameters = [self.parser parametersFromURL:sampleURL];
    
    XCTAssertTrue(parameters == nil, @"");
}

/** Occasionally we'll get a URL with a query seperator but no query. */
- (void) testURLParsingFromURLWithEmptyQuery
{
    
    NSURL *sampleURL = [NSURL URLWithString:@"http://google.com/?"];
    
    NSDictionary *parameters = [self.parser parametersFromURL:sampleURL];
    
    XCTAssertTrue(parameters == nil, @"");
}

/** Some URLs are just perfect. What does the fox say? */
- (void) testURLParsingFromURLWithPerfectQuery
{
    
    NSURL *sampleURL = [NSURL URLWithString:@"http://google.com/?q=What%20does%20the%20fox%20say"];
    
    NSDictionary *parameters = [self.parser parametersFromURL:sampleURL];
    
    XCTAssertTrue(parameters != nil, @"");
}

/** Some URLs have epty queries. */
- (void) testURLParsingFromURLWithImperfectQuery
{
    
    NSURL *sampleURL = [NSURL URLWithString:@"http://google.com/?q="];
    
    NSDictionary *parameters = [self.parser parametersFromURL:sampleURL];
    
    XCTAssertTrue([parameters[@"q"] isEqualTo:@""], @"");
}


@end
