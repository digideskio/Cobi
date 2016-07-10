//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactViewModel.h"
#import "Contact.h"

@class PhoneNumberFormatter;



@interface ContactViewModelFactory : NSObject


#pragma mark - Init
+ (instancetype)defaultFactory;
- (instancetype)initWithPhoneNumberFormatter:(PhoneNumberFormatter *)phoneNumberFormatter NS_DESIGNATED_INITIALIZER;

#pragma mark - Public
- (ContactViewModel *)viewModelWithContact:(Contact *)contact;
@end


@interface ContactViewModelFactory (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end