//
//  ContactsViewController.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/9/16.
//  Copyright © 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactsFRCFactory.h"
#import "ContactTableViewCell.h"
#import "Contact.h"
#import "ContactsCountFormatter.h"
#import "NSManagedObjectContext+SaveToStore.h"
#import "ContactsDataSource.h"
#import "ContactViewModel.h"
#import "AddContactViewController.h"
#import "PhoneCallManager.h"



@interface ContactsViewController () <APFRCTableViewDataSourceDelegate, UITableViewDelegate>


#pragma mark - Outlets
@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(weak, nonatomic) IBOutlet UILabel *contactsCountLabel;

#pragma mark - DataSource
@property(nonatomic, strong) ContactsDataSource *dataSource;
@end



@implementation ContactsViewController


#pragma mark - Accessors

- (NSManagedObjectContext *)mainContext
{
    return self.coreDataStack.mainMOC;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self updateContactsCountLabel:0];
    [self setupDataSource];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];

    CoreDataStackInjector *injector = [CoreDataStackInjector injectorWithCoreDataStack:self.coreDataStack];
    [injector injectInFirstViewControllerOfNavigationController:segue.destinationViewController];
}

#pragma mark - Setup

- (void)setupDataSource
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:YES];
    ContactsFRCFactory *frcFactory = [ContactsFRCFactory factoryWithManagedObjectContext:self.mainContext];
    NSFetchedResultsController *frc = [frcFactory contactsFRCWithSortDescriptors:@[ sortDescriptor ]];
    self.dataSource = [[ContactsDataSource alloc] initWithTableView:self.tableView
                                           fetchedResultsController:frc
                                                cellReuseIdentifier:[ContactTableViewCell reuseIdentifier]
                                                           delegate:self];
}

#pragma mark - UITableViewDelegate

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Contact *contact = [self contactAtIndexPath:indexPath];
    [[PhoneCallManager defaultManager] makePhoneCallWithPhoneNumber:contact.phone];
}

#pragma mark - APFRCTableViewDataSourceDelegate

- (void)dataSourceDidChanged:(id <APDataSource>)dataSource
{
    [self updateContactsCountLabel:dataSource.allObjectsCount];
}

- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath
                 inDataSource:(APFRCTableViewDataSource *)dataSource
{
    return YES;
}

- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
         forRowAtIndexPath:(NSIndexPath *)indexPath
              inDataSource:(APFRCTableViewDataSource *)dataSource
{
    [self deleteContact:[self contactAtIndexPath:indexPath]];
}

#pragma mark - Private

- (void)updateContactsCountLabel:(NSUInteger)contactsCount
{
    self.contactsCountLabel.text = [[ContactsCountFormatter new] contactsCountStringWithContactsCount:contactsCount];
}

- (Contact *)contactAtIndexPath:(NSIndexPath *)indexPath
{
    ContactViewModel *viewModel = [self.dataSource objectAtIndexPath:indexPath];
    return [self.mainContext existingObjectWithID:viewModel.modelID error:nil];
}

- (void)deleteContact:(Contact *)contact
{
    [self.mainContext performBlockAndSave:^{
        [self.mainContext deleteObject:contact];
    }                          completion:nil];
}

@end
