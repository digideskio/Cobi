//
//  PhoneNumberFormatterTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//



#import "PhoneNumberFormatter.h"
#import "NBPhoneNumberUtil.h"



@interface PhoneNumberFormatterTests : XCTestCase


#pragma mark - SUT
@property(nonatomic, strong) PhoneNumberFormatter *sut;

#pragma mark - Mocks
@property(nonatomic, strong) id phoneNumberUtilityMock;

@end



@interface PhoneNumberFormatter (UnitTests)


@property(nonatomic, strong) NBPhoneNumberUtil *phoneNumberUtility;
@end



@implementation PhoneNumberFormatterTests


- (void)setUp
{
    [super setUp];

    self.phoneNumberUtilityMock = [OCMockObject partialMockForObject:[NBPhoneNumberUtil new]];

    self.sut = [PhoneNumberFormatter new];
    self.sut.phoneNumberUtility = self.phoneNumberUtilityMock;
}

#pragma mark - Tests

- (void)testFormattedPhoneNumber_CorrectPhoneNumber
{
    // given
    NSString *phoneNumber = @"0669650000";

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@YES] isValidNumber:[OCMArg any]];

    // call
    NSString *formattedPhone = [self.sut formattedPhoneNumber:phoneNumber];

    // expectations
    expect(formattedPhone).to.equal(@"+1 066-965-0000");
}

- (void)testFormattedPhoneNumber_IncorrectPhoneNumber
{
    // given
    NSString *phoneNumber = @"0";

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@NO] isValidNumber:[OCMArg any]];

    // call
    NSString *formattedPhone = [self.sut formattedPhoneNumber:phoneNumber];

    // expectations
    expect(formattedPhone).to.equal(phoneNumber);
}

- (void)testFormattedPhoneNumber_EmptyPhoneNumber
{
    // given
    NSString *phoneNumber = @"";

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@NO] isValidNumber:[OCMArg any]];

    // call
    NSString *formattedPhone = [self.sut formattedPhoneNumber:phoneNumber];

    // expectations
    expect(formattedPhone).to.equal(phoneNumber);
}

@end
