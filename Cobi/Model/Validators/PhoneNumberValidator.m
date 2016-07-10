//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <libPhoneNumber-iOS/NBPhoneNumberUtil.h>
#import "PhoneNumberValidator.h"
#import "APValidator+SubclassesOnly.h"



@interface PhoneNumberValidator ()

@property(nonatomic, strong) NBPhoneNumberUtil *phoneNumberUtility;
@end



@implementation PhoneNumberValidator


#pragma mark - Accessors

- (NBPhoneNumberUtil *)phoneNumberUtility
{
    if (! _phoneNumberUtility) {
        _phoneNumberUtility = [NBPhoneNumberUtil new];
    }
    return _phoneNumberUtility;
}


#pragma mark - APValidator

- (void)validate
{
    [super validate];

    NSString *validationString = nil;

    if (! [self.validationObject isKindOfClass:[NSString class]]) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"%@ validationObject should be NSString!",
                           NSStringFromClass([self class])];
    }
    else {
        validationString = self.validationObject;
    }

    self.valid = [self isValidPhoneNumber:validationString];
}

#pragma mark - Private

- (BOOL)isValidPhoneNumber:(NSString *)phoneNumber
{
    NSError *error = nil;
    NBPhoneNumber *number = [self.phoneNumberUtility parseWithPhoneCarrierRegion:phoneNumber error:&error];
    return ! error && [self.phoneNumberUtility isValidNumber:number];
}

@end