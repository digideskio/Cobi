//
//  PhoneCallManagerTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhoneCallManager.h"



@interface PhoneCallManagerTests : XCTestCase

@end



@implementation PhoneCallManagerTests


#pragma mark - Tests

- (void)testMakePhoneCallWithPhoneNumber_CallApplicationWithValidURL
{
    // given
    id applicationMock = [OCMockObject mockForClass:[UIApplication class]];
    PhoneCallManager *sut = [[PhoneCallManager alloc] initWithApplication:applicationMock];

    // stubs and mocks

    [[applicationMock expect] openURL:[NSURL URLWithString:@"tel:+111111"]];

    // call
    [sut makePhoneCallWithPhoneNumber:@"+111111"];

    // expectations
    [applicationMock verify];
}


@end
