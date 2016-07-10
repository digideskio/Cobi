//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "PhoneNumberFormatter.h"
#import "NBPhoneNumberUtil.h"



@interface PhoneNumberFormatter ()


@property(nonatomic, strong) NBPhoneNumberUtil *phoneNumberUtility;
@end



@implementation PhoneNumberFormatter


#pragma mark - Accessors

- (NBPhoneNumberUtil *)phoneNumberUtility
{
    if (! _phoneNumberUtility) {
        _phoneNumberUtility = [NBPhoneNumberUtil new];
    }
    return _phoneNumberUtility;
}

#pragma mark - Public

- (NSString *)formattedPhoneNumber:(NSString *)phoneNumber
{
    NSString *result = nil;

    NSError *error = nil;
    NBPhoneNumber *number = [self.phoneNumberUtility parseWithPhoneCarrierRegion:phoneNumber error:&error];
    if (! error && [self.phoneNumberUtility isValidNumber:number]) {
        result = [self.phoneNumberUtility format:number numberFormat:NBEPhoneNumberFormatINTERNATIONAL error:&error];
        if (error) {
            result = nil;
        }
    }
    return result ? result : phoneNumber;
}

@end