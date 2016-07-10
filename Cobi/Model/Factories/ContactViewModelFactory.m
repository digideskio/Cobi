//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactViewModelFactory.h"
#import "PhoneNumberFormatter.h"



@interface ContactViewModelFactory ()


@property(nonatomic, strong) PhoneNumberFormatter *phoneNumberFormatter;
@end



@implementation ContactViewModelFactory


#pragma mark - Init

+ (instancetype)defaultFactory
{
    return [[self alloc] initWithPhoneNumberFormatter:[PhoneNumberFormatter new]];
}

- (instancetype)initWithPhoneNumberFormatter:(PhoneNumberFormatter *)phoneNumberFormatter
{
    NSParameterAssert(phoneNumberFormatter);
    self = [super init];
    if (self) {
        self.phoneNumberFormatter = phoneNumberFormatter;
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

#pragma mark - Public

- (ContactViewModel *)viewModelWithContact:(Contact *)contact
{
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    NSString *phoneNumberFormatted = [self.phoneNumberFormatter formattedPhoneNumber:contact.phone];
    return [[ContactViewModel alloc] initWithModelID:contact.objectID
                                            fullName:fullName
                                phoneNumberFormatted:phoneNumberFormatted];
}

@end