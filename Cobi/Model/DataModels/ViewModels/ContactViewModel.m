//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactViewModel.h"



@implementation ContactViewModel


#pragma mark - Init

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithModelID:(NSManagedObjectID *)modelID
                       fullName:(NSString *)fullName
           phoneNumberFormatted:(NSString *)phoneNumberFormatted
{
    self = [super init];
    if (self) {
        _modelID = modelID;
        _fullName = fullName;
        _phoneNumberFormatted = phoneNumberFormatted;
    }

    return self;
}

+ (instancetype)modelWithModelID:(NSManagedObjectID *)modelID
                        fullName:(NSString *)fullName
            phoneNumberFormatted:(NSString *)phoneNumberFormatted
{
    return [[self alloc] initWithModelID:modelID
                                fullName:fullName
                    phoneNumberFormatted:phoneNumberFormatted];
}


@end