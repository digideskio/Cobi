//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoreDataFactory.h"



@interface ContactsFRCFactory : BaseCoreDataFactory


- (NSFetchedResultsController *)contactsFRCWithSortDescriptors:(NSArray *)sortDescriptors;
@end