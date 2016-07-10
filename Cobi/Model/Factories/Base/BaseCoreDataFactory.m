//
// Created by Nickolay Sheika on 7/9/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "BaseCoreDataFactory.h"



@implementation BaseCoreDataFactory

+ (instancetype)factoryWithManagedObjectContext:(NSManagedObjectContext *)context
{
    return [[self alloc] initWithManagedObjectContext:context];
}

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self) {
        _context = context;
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

@end