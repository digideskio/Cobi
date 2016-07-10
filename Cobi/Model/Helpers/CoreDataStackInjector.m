//
// Created by Nickolay Sheika on 7/10/16.
// Copyright (c) 2016 Nickolay Sheika. All rights reserved.
//

#import "CoreDataStackInjector.h"
#import "APCDController.h"



@implementation CoreDataStackInjector


#pragma mark - Init

+ (instancetype)injectorWithCoreDataStack:(APCDController *)coreDataStack
{
    return [[self alloc] initWithCoreDataStack:coreDataStack];
}

- (instancetype)initWithCoreDataStack:(APCDController *)coreDataStack
{
    NSParameterAssert(coreDataStack);
    self = [super init];
    if (self) {
        _coreDataStack = coreDataStack;
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

#pragma mark - Public

- (void)injectInFirstViewControllerOfNavigationController:(UINavigationController *)navigationController
{
    [self injectIn:navigationController.viewControllers.firstObject];
}

- (void)injectIn:(id <CoreDataStackInjectable>)target
{
    target.coreDataStack = self.coreDataStack;
}


@end