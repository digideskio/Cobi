//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSFetchedResultsController (Convenience)


+ (NSFetchedResultsController *)controllerForManagedObjectClass:(Class)managedObjectClass
                                                        context:(NSManagedObjectContext *)context
                                                      predicate:(NSPredicate *)predicate
                                             sectionNameKeyPath:(NSString *)sectionName
                                                sortDescriptors:(NSArray *)sortDescriptors;


@end