//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "ContactsFRCFactory.h"
#import "NSFetchedResultsController+Convenience.h"
#import "Contact.h"



@implementation ContactsFRCFactory


- (NSFetchedResultsController *)contactsFRCWithSortDescriptors:(NSArray *)sortDescriptors
{
    return [NSFetchedResultsController controllerForManagedObjectClass:[Contact class]
                                                               context:self.context
                                                             predicate:nil
                                                    sectionNameKeyPath:nil
                                                       sortDescriptors:sortDescriptors];
}


@end