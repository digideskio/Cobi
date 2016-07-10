//
//  ContactViewModelFactoryTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InMemoryCoreDataTests.h"
#import "ContactViewModelFactory.h"
#import "PhoneNumberFormatter.h"


@interface ContactViewModelFactoryTests : InMemoryCoreDataTests

@end



@implementation ContactViewModelFactoryTests


#pragma mark - Test

- (void)testViewModelWithContact_CreatesRightContact
{
    // given
    id phoneNumberFormatterMock = [OCMockObject mockForClass:[PhoneNumberFormatter class]];
    ContactViewModelFactory *sut = [[ContactViewModelFactory alloc] initWithPhoneNumberFormatter:phoneNumberFormatterMock];
    Contact *fakeContact = [self fakeContact];

    // stubs and mocks
    [[[phoneNumberFormatterMock stub] andReturn:@"+222222"] formattedPhoneNumber:@"+111111"];

    // call
    ContactViewModel *viewModel = [sut viewModelWithContact:fakeContact];

    // expectations
    expect(viewModel.modelID).to.equal(fakeContact.objectID);
    expect(viewModel.fullName).to.equal(@"FirstName SecondName");
    expect(viewModel.phoneNumberFormatted).to.equal(@"+222222");
}

#pragma mark - Private

- (Contact *)fakeContact
{
    NSManagedObjectContext *context = self.coreDataStack.mainMOC;
    __block Contact *contact = nil;
    [context performBlockAndWait:^{
        contact = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Contact class])
                                                inManagedObjectContext:context];
        contact.firstName = @"FirstName";
        contact.lastName = @"SecondName";
        contact.phone = @"+111111";
    }];
    [context save:nil];

    return contact;
}

@end
