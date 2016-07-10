//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "NSFetchedResultsController+Convenience.h"



@implementation NSFetchedResultsController (Convenience)


+ (NSFetchedResultsController *)controllerForManagedObjectClass:(Class)managedObjectClass
                                                        context:(NSManagedObjectContext *)context
                                                      predicate:(NSPredicate *)predicate
                                             sectionNameKeyPath:(NSString *)sectionName
                                                sortDescriptors:(NSArray *)sortDescriptors
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(managedObjectClass)];
    fetchRequest.predicate = predicate;
    fetchRequest.fetchBatchSize = 20;
    fetchRequest.sortDescriptors = sortDescriptors;

    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                                               managedObjectContext:context
                                                                                                 sectionNameKeyPath:sectionName
                                                                                                          cacheName:nil];


    return fetchedResultsController;
}

@end