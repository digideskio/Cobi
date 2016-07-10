//
//  ContactsDataSourceTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//



#import "ContactsDataSource.h"
#import "InMemoryCoreDataTests.h"
#import "NSFetchedResultsController+Convenience.h"
#import "Contact.h"
#import "ContactViewModelFactory.h"



@interface ContactsDataSourceTests : InMemoryCoreDataTests


#pragma mark - Mocks
@property(nonatomic, strong) id contactViewModelFactoryMock;
@property(nonatomic, strong) id mockCellConfiguration;
@property(nonatomic, strong) id mockTableView;

#pragma mark - SUT
@property(strong, nonatomic) ContactsDataSource *sut;

#pragma mark - Fake Data
@property(nonatomic, strong) ContactViewModel *fakeViewModel;
@end



@interface ContactsDataSource (UnitTests)


#pragma mark - Dependencies
@property(nonatomic, strong) ContactViewModelFactory *contactViewModelFactory;
@end



@implementation ContactsDataSourceTests


- (void)setUp
{
    [super setUp];

    self.mockTableView = [OCMockObject niceMockForClass:[UITableView class]];
    self.mockCellConfiguration = [OCMockObject mockForProtocol:@protocol(APCellProtocol)];
    self.contactViewModelFactoryMock = [OCMockObject mockForClass:[ContactViewModelFactory class]];

    NSFetchedResultsController *frc = [NSFetchedResultsController controllerForManagedObjectClass:[Contact class]
                                                                                          context:self.coreDataStack.mainMOC
                                                                                        predicate:nil
                                                                               sectionNameKeyPath:nil
                                                                                  sortDescriptors:@[ ]];

    self.sut = [[ContactsDataSource alloc] initWithTableView:self.mockTableView
                                    fetchedResultsController:frc
                                         cellReuseIdentifier:@"FakeCellIdentifier1"];

    self.fakeViewModel = [[ContactViewModel alloc] initWithModelID:nil
                                                          fullName:@"Test Full Name"
                                              phoneNumberFormatted:@"+111 111"];
    [[[self.contactViewModelFactoryMock stub] andReturn:self.fakeViewModel] viewModelWithContact:[OCMArg any]];
    self.sut.contactViewModelFactory = self.contactViewModelFactoryMock;

    [self createFakeContact];
}

#pragma mark - Tests

- (void)testSectionsCount
{
    // call
    NSUInteger sectionsCount = [self.sut sectionsCount];

    // verifications
    expect(sectionsCount).to.equal(1);
}

- (void)testObjectAtIndexPath
{
    // call
    ContactViewModel *object = [self.sut objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

    // verifications
    expect(object).to.equal(self.fakeViewModel);
}

- (void)testObjectsInSection
{
    // call
    NSArray *objects = [self.sut objectsInSection:0];

    // verifications
    expect(objects).to.equal(@[ self.fakeViewModel ]);
}

- (void)testNumberOfSections
{
    // verifications
    expect([self.sut numberOfSectionsInTableView:self.mockTableView]).to.equal(1);
}

- (void)testNumberOfRowsInSection
{
    // verifications
    expect([self.sut tableView:self.mockTableView numberOfRowsInSection:0]).to.equal(1);
}

- (void)testCellForRowAtIndexPath_ShouldAskTableViewForCellAndConfigureCell
{
    // given
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

    // expectations
    [[[self.mockTableView expect] andReturn:self.mockCellConfiguration] dequeueReusableCellWithIdentifier:@"FakeCellIdentifier1"
                                                                                             forIndexPath:indexPath];
    [[self.mockCellConfiguration expect] reloadWithModel:[OCMArg any] atIndexPath:indexPath];

    // call
    [self.sut tableView:self.mockTableView cellForRowAtIndexPath:indexPath];

    // verifications
    [self.mockTableView verify];
    [self.mockCellConfiguration verify];
}

#pragma mark - Private

- (Contact *)createFakeContact
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
