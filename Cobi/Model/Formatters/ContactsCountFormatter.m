//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactsCountFormatter.h"



@implementation ContactsCountFormatter


- (NSString *)contactsCountStringWithContactsCount:(NSUInteger)contactsCount
{
    NSString *text = contactsCount == 1 ? NSLocalizedString(@"contact", nil) : NSLocalizedString(@"contacts", nil);
    NSString *capitalizedText = [text capitalizedString];
    NSString *result = [NSString stringWithFormat:@"%lu %@", (unsigned long)contactsCount, capitalizedText];
    return result;
}


@end