//
//  ContactsFRCFactoryTests.m
//  Cobi
//
//  Created by Nickolay Sheika on 7/10/16.
//  Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactsFRCFactory.h"
#import "InMemoryCoreDataTests.h"



@interface ContactsFRCFactoryTests : InMemoryCoreDataTests

@end



@implementation ContactsFRCFactoryTests


- (void)testContactsFRCWithSortDescriptors_ReturnsCorrectFRC
{
    // given
    NSManagedObjectContext *context = self.coreDataStack.mainMOC;
    ContactsFRCFactory *sut = [ContactsFRCFactory factoryWithManagedObjectContext:context];
    NSSortDescriptor *fakeSortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"fake1" ascending:YES];
    NSSortDescriptor *fakeSortDescriptor2 = [NSSortDescriptor sortDescriptorWithKey:@"fake2" ascending:YES];

    // stubs and mocks

    // call
    NSFetchedResultsController *frc = [sut contactsFRCWithSortDescriptors:@[ fakeSortDescriptor1, fakeSortDescriptor2 ]];

    // expectations
    expect(frc.managedObjectContext).to.equal(context);
    expect(frc.fetchRequest.entityName).to.equal(@"Contact");
    expect(frc.fetchRequest.sortDescriptors).to.haveCountOf(2);
    expect(frc.fetchRequest.sortDescriptors[0]).to.equal(fakeSortDescriptor1);
    expect(frc.fetchRequest.sortDescriptors[1]).to.equal(fakeSortDescriptor2);
}

@end
