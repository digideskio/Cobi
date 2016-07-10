//
//  ContactsCountFormatterTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactsCountFormatter.h"



@interface ContactsCountFormatterTests : XCTestCase


#pragma mark - SUT
@property(nonatomic, strong) ContactsCountFormatter *sut;
@end



@implementation ContactsCountFormatterTests


- (void)setUp
{
    [super setUp];

    self.sut = [ContactsCountFormatter new];
}

#pragma mark - Tests

- (void)testContactsCountStringWithContactsCount_CountEqualOne
{
    NSString *result = [self.sut contactsCountStringWithContactsCount:1];
    expect(result).to.equal(@"1 Contact");
}

- (void)testContactsCountStringWithContactsCount_CountMoreThanOne
{
    NSString *result = [self.sut contactsCountStringWithContactsCount:300];
    expect(result).to.equal(@"300 Contacts");
}

@end
