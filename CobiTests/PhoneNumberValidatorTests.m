//
//  PhoneNumberValidatorTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//




#import <libPhoneNumber-iOS/NBPhoneNumberUtil.h>
#import "PhoneNumberValidator.h"



@interface PhoneNumberValidatorTests : XCTestCase


#pragma mark - SUT
@property(nonatomic, strong) PhoneNumberValidator *sut;

#pragma mark - Mocks
@property(nonatomic, strong) id phoneNumberUtilityMock;
@end



@interface PhoneNumberValidator (UnitTests)


@property(nonatomic, strong) NBPhoneNumberUtil *phoneNumberUtility;
@end



@implementation PhoneNumberValidatorTests


- (void)setUp
{
    [super setUp];

    self.phoneNumberUtilityMock = [OCMockObject partialMockForObject:[NBPhoneNumberUtil new]];

    self.sut = [PhoneNumberValidator new];
    self.sut.phoneNumberUtility = self.phoneNumberUtilityMock;
}


#pragma mark - Tests

- (void)testValidate_ThrowsExceptionWhenValidationObjectIsNotAString
{
    // given
    NSObject *fakeObject = [NSObject new];
    self.sut.validationObject = fakeObject;

    // call
    expect(^{
        [self.sut validate];
    }).to.raiseAny();
}

- (void)testValidate_CorrectPhoneNumber
{
    // given
    NSString *phoneNumber = @"0669650000";
    self.sut.validationObject = phoneNumber;

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@YES] isValidNumber:[OCMArg any]];

    // call
    [self.sut validate];

    // expectations
    expect(self.sut.isValid).to.beTruthy();
}

- (void)testValidate_IncorrectPhoneNumber
{
    // given
    NSString *phoneNumber = @"0";
    self.sut.validationObject = phoneNumber;

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@NO] isValidNumber:[OCMArg any]];

    // call
    [self.sut validate];

    // expectations
    expect(self.sut.isValid).to.beFalsy();
}

- (void)testValidate_EmptyPhoneNumber
{
    // given
    self.sut.validationObject = @"";

    // stubs and mocks
    [[[self.phoneNumberUtilityMock stub] andReturnValue:@NO] isValidNumber:[OCMArg any]];

    // call
    [self.sut validate];

    // expectations
    expect(self.sut.isValid).to.beFalsy();
}


@end
