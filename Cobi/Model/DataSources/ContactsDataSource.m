//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactsDataSource.h"
#import "ContactViewModel.h"
#import "ContactViewModelFactory.h"



@interface ContactsDataSource ()


#pragma mark - Data
@property(nonatomic, strong) NSArray *viewModels;

#pragma mark - Dependencies
@property(nonatomic, strong) ContactViewModelFactory *contactViewModelFactory;
@end



@implementation ContactsDataSource


#pragma mark - Accessors

- (ContactViewModelFactory *)contactViewModelFactory
{
    if (!_contactViewModelFactory) {
        _contactViewModelFactory = [ContactViewModelFactory defaultFactory];
    }
    return _contactViewModelFactory;
}

#pragma mark - APDataSource

- (NSUInteger)allObjectsCount
{
    return [self.viewModels count];
}

- (NSArray *)objectsInSection:(NSUInteger)section
{
    return section == 0 ? self.viewModels : nil;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? self.viewModels[(NSUInteger) indexPath.row] : nil;
}

- (NSIndexPath *)indexPathForObject:(id)object
{
    NSUInteger index = [self.viewModels indexOfObjectIdenticalTo:object];
    return index == NSNotFound ? nil : [NSIndexPath indexPathForRow:index inSection:0];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    NSArray *contacts = [super objectsInSection:0];
    self.viewModels = [self buildViewModelsFromContacts:contacts];

    [super controllerDidChangeContent:controller];
}

#pragma mark - Private

- (NSArray *)buildViewModelsFromContacts:(NSArray *)contacts
{
    NSMutableArray *viewModels = [NSMutableArray arrayWithCapacity:[contacts count]];
    for (Contact *contact in contacts) {
        ContactViewModel *viewModel = [self.contactViewModelFactory viewModelWithContact:contact];
        [viewModels addObject:viewModel];
    }
    return [viewModels copy];
}

@end